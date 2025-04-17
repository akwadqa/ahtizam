import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_checker.dart';

Future<T> retryOperation<T>(Future<T> Function() operation,
    {int maxAttempts = 3}) async {
  int attempts = 0;
  while (attempts < maxAttempts) {
    try {
      return await operation();
    } catch (e) {
      attempts++;
      print('Operation failed (attempt $attempts): $e');
      if (attempts >= maxAttempts) rethrow;
      // Exponential backoff
      await Future.delayed(
          Duration(milliseconds: pow(2, attempts).toInt() * 500));
    }
  }
  throw Exception('Failed after $maxAttempts attempts');
}

Future<void> safelyPop(BuildContext context) async {
  FocusScope.of(context).unfocus();
  await Future.delayed(const Duration(milliseconds: 100));
  if (context.mounted) context.maybePop();
}

double calculateDistanceKm(GeoPoint from, GeoPoint to) {
  const earthRadius = 6371; // km

  final lat1 = from.latitude * pi / 180;
  final lon1 = from.longitude * pi / 180;
  final lat2 = to.latitude * pi / 180;
  final lon2 = to.longitude * pi / 180;

  final dLat = lat2 - lat1;
  final dLon = lon2 - lon1;

  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}

Future<void> createTestDriver() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // First check if we can enable the network
    try {
      await firestore.enableNetwork();
      print('Network enabled');
    } catch (e) {
      print('Could not enable network: $e');
    }

    // Create a proper GeoPoint
    final GeoPoint driverLocation =
        GeoPoint(33.61143678366949, 36.31667420268059);

    // Try to create the driver document with offline support
    final DocumentReference driverRef =
        firestore.collection('drivers').doc('test_driver');

    print('Attempting to create/update driver document...');

    // First try to read from cache
    try {
      final cachedDoc =
          await driverRef.get(const GetOptions(source: Source.cache));
      if (cachedDoc.exists) {
        print('Found cached driver document: ${cachedDoc.data()}');
      }
    } catch (e) {
      print('No cached driver document found: $e');
    }

    // Prepare the driver data
    final Map<String, dynamic> driverData = {
      'id': 'test_driver',
      'name': 'Test Driver',
      'isAvailable': true,
      'isOnline': true,
      'location': {'geopoint': driverLocation, 'address': 'Al Tal, Syria'},
      'lastUpdated': FieldValue.serverTimestamp(),
    };

    print('Setting driver data: $driverData');

    // Try to set the data with retry
    await retryOperation(
        () => driverRef.set(driverData, SetOptions(merge: true)));
    print('Initial write completed');

    // Try to verify the write immediately in cache
    try {
      final writtenDoc =
          await driverRef.get(const GetOptions(source: Source.cache));
      if (writtenDoc.exists) {
        print('Driver document written to local cache: ${writtenDoc.data()}');
      } else {
        print('Document not found in cache immediately after write');
      }
    } catch (e) {
      print('Error verifying local write: $e');
    }

    // Try to force a server sync
    try {
      await firestore.waitForPendingWrites();
      print('Pending writes completed');
    } catch (e) {
      print('Error waiting for pending writes: $e');
    }

    // Check connection status
    bool isConnected = await FirebaseChecker.waitForConnection();
    if (!isConnected) {
      print(
          'Driver created in offline mode. Will sync when connection is restored.');
    } else {
      print('Driver created and synced with server.');

      // Verify server write if online
      try {
        final serverDoc =
            await driverRef.get(const GetOptions(source: Source.server));
        if (serverDoc.exists) {
          print('Verified server write: ${serverDoc.data()}');
        } else {
          print('Document not found on server after write');
        }
      } catch (e) {
        print('Could not verify server write: $e');
      }
    }
  } catch (e) {
    print('Error creating test driver: $e');
    rethrow;
  }
}

Future<void> createCollection() async {
  try {
    // Reference to the collection (creates if doesn't exist)
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Add a document with auto-generated ID
    await users.add({
      'name': 'John Doe',
      'email': 'john@example.com',
      'createdAt': FieldValue.serverTimestamp(),
    });

    print('Collection and document created!');
  } catch (e) {
    print('Error creating collection: $e');
  }
}
