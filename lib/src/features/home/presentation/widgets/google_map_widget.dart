import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:standard_project/src/features/home/application/map_service.dart';
import 'package:standard_project/src/shared_widgets/fade_circle_loading_indicator.dart';

class GoogleMapWidget extends ConsumerWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsync = ref.watch(mapProviderProvider);

    return locationAsync.when(
      data: (currentLocation) {
        if (currentLocation == null) {
          return const Center(child: Text("Location unavailable"));
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 15,
          ),
          myLocationEnabled: true,
        );
      },
      loading: () => const Center(child: FadeCircleLoadingIndicator()),
      error: (error, _) => Center(child: Text("Error: $error")),
    );
  }
}
