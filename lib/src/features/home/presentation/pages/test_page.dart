import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/utils/helper_methods.dart';
import 'package:ahtizam/src/utils/firebase_checker.dart';
import '../controllers/order_controller.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              try {
                final isConnected = await FirebaseChecker.waitForConnection();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isConnected
                        ? 'Connected to Firestore'
                        : 'Operating in offline mode'),
                    backgroundColor: isConnected ? Colors.green : Colors.orange,
                  ),
                );
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  // Show loading indicator
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Initializing Firebase...'),
                  //     duration: Duration(seconds: 1),
                  //   ),
                  // );

                  // // Check Firebase initialization
                  // await FirebaseChecker.checkAndInitialize();

                  // if (!context.mounted) return;
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Creating test driver...'),
                  //     duration: Duration(seconds: 1),
                  //   ),
                  // );

                  // Create test driver
                  await createTestDriver();

                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Test driver created (may be in offline mode)'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Create Test Driver'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Check Firebase initialization first
                  await FirebaseChecker.checkAndInitialize();

                  final controller = ref.read(orderControllerProvider.notifier);
                  await controller.createOrder(
                    pickupLat: 37.4219983,
                    pickupLng: -122.084,
                    workshopLat: 37.421105912917845,
                    workshopLng:  -122.0846013352275,
                    truckType: 'standard',
                    price: 100.0,
                  );

                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order created successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Create Test Order'),
            ),
          ],
        ),
      ),
    );
  }
}
