import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/features/home/application/map_service.dart';

import '../../../../shared_widgets/fade_circle_loading_indicator.dart';
import '../../../../theme/app_colors.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  GoogleMapController? _controller;
  BitmapDescriptor? _customMarker;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  /// **Load and Scale Custom Marker from Asset**
  Future<void> _loadCustomMarker() async {
    try {
      final Uint8List markerIcon =
          await 'assets/icons/my_marker.png'.toMarkerBytes(targetSize: 30);

      _customMarker = BitmapDescriptor.fromBytes(markerIcon);
    } catch (e) {
      debugPrint('Error loading custom marker: $e');
    }
  }

  /// **Capture Screenshot and Save it**
  Future<void> captureScreenshot() async {
    if (_controller != null) {
      final imageBytes = await _controller?.takeSnapshot();
      if (imageBytes != null) {
        ref.read(mapControllerProvider.notifier).saveMapScreenshot(imageBytes);
        debugPrint("✅ Screenshot Captured & Saved!");
      } else {
        debugPrint("❌ Screenshot Failed: ImageBytes is null");
      }
    } else {
      debugPrint("❌ Screenshot Failed: Controller is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapControllerProvider);

    return mapState.when(
      data: (currentLocation) {
        if (currentLocation == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: AppColors.primary),
                4.verticalSpace,
                Text("Location unavailable"),
              ],
            ),
          );
        }

        return GoogleMap(
          mapType: MapType.normal,
          onTap: (LatLng latLng) {
            ref.read(mapControllerProvider.notifier).setCurrentLocation(latLng);
            _controller?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: latLng, zoom: 16),
            ));
          },
          markers: {
            Marker(
              markerId: const MarkerId("currentLocation"),
              position: currentLocation,
              icon: _customMarker ?? BitmapDescriptor.defaultMarker,
            ),
          },
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 16,
          ),
          myLocationEnabled: false,
          onMapCreated: (controller) {
            ref
                .read(mapControllerProvider.notifier)
                .setMapController(controller);
            // Future.delayed(Duration(seconds: 1), () {
            //   captureScreenshot(); // ✅ Capture screenshot after delay
            // });
          },
        );
      },
      loading: () {
        // captureScreenshot();
        return const Center(child: FadeCircleLoadingIndicator());
      },
      error: (error, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, color: AppColors.primary),
            4.verticalSpace,
            Text("Error: $error"),
          ],
        ),
      ),
    );
  }
}
