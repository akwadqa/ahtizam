import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controller/select_location_from_map_controller.dart';

import '../../../../shared_widgets/fade_circle_loading_indicator.dart';
import '../../../../theme/app_colors.dart';
import '../controller/location_search_controller.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  GoogleMapController? _controller;
  BitmapDescriptor? _customMarker;
  String locationAddress = "";
  final geocoding = GoogleGeocodingApi(ServicesUrls.mapApiKey);
  PolylinePoints polylinePoints = PolylinePoints();

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

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapControllerProvider);
    final isSelectLocationFromMap =
        ref.watch(selectLocationFromMapControllerProvider);
    final mapController = ref.read(mapControllerProvider.notifier);

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
          onTap: isSelectLocationFromMap
              ? (LatLng latLng) async {
                  await mapController.setCurrentLocation(latLng);
                  mapController.mapController
                      ?.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: latLng,
                      zoom: 17,
                    ),
                  ));
                  // Update location fields after setting the point and getting the address
                  ref
                      .read(locationSearchControllerProvider.notifier)
                      .updateLocationFromMap();
                }
              : null,
          markers: {
            // if (mapController.firstPoint != null)
            Marker(
              markerId: const MarkerId("firstPoint"),
              position: mapController.firstPoint ?? currentLocation,
              icon: _customMarker ?? BitmapDescriptor.defaultMarker,
            ),
            if (mapController.secondPoint != null)
              Marker(
                alpha: 0.8,
                markerId: const MarkerId("secondPoint"),
                position: mapController.secondPoint!,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
              ),
          },
          polylines: mapController.polylineCoordinates.isNotEmpty
              ? {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    points: mapController.polylineCoordinates,
                    color: AppColors.primary,
                    width: 3,
                  ),
                }
              : {},
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 17,
          ),
          myLocationEnabled: false,
          onMapCreated: (controller) {
            mapController.setMapController(controller);
          },
        );
      },
      loading: () {
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
