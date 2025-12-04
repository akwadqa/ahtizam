// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:google_play_services_availability/google_play_services_availability.dart';

// class FirebaseChecker {
//   static Future<void> checkAndInitialize() async {
//     try {
//       // Check Google Play Services first
//       // final status = await GooglePlayServicesAvailability.instance.checkPlayServicesAvailability();
//       // if (status != GooglePlayServicesAvailabilityResult.success) {
//       //   throw Exception('Google Play Services not available: $status');
//       // }

//       // Check if Firebase is initialized
//       if (!Firebase.apps.isNotEmpty) {
//         throw Exception('Firebase not initialized');
//       }

//       // Enable offline persistence
//       // await FirebaseFirestore.instance.enablePersistence(
//       //   const PersistenceSettings(synchronizeTabs: true),
//       // );

//       // Wait for network connection
//       bool isConnected = false;
//       int attempts = 0;
//       const maxAttempts = 3;

//       while (!isConnected && attempts < maxAttempts) {
//         try {
//           attempts++;
//           print('Attempting to connect to Firestore (attempt $attempts)...');
          
//           // Try to enable network and perform a test read
//           await FirebaseFirestore.instance.enableNetwork();
//           await Future.delayed(const Duration(seconds: 2)); // Give it time to connect
          
//           // Test connection with a simple read
//           await FirebaseFirestore.instance
//               .collection('test')
//               .limit(1)
//               .get(const GetOptions(source: Source.server));
          
//           isConnected = true;
//           print('Successfully connected to Firestore');
//         } catch (e) {
//           print('Connection attempt $attempts failed: $e');
//           if (attempts < maxAttempts) {
//             await Future.delayed(Duration(seconds: attempts * 2));
//           }
//         }
//       }

//       if (!isConnected) {
//         print('Operating in offline mode');
//         // Don't throw an error, let it work offline
//       }
//     } catch (e) {
//       print('Firebase initialization check failed: $e');
//       rethrow;
//     }
//   }

//   static Future<bool> waitForConnection() async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('test')
//           .limit(1)
//           .get(const GetOptions(source: Source.server));
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
