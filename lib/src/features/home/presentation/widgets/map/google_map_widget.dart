import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:ahtizam/gen/assets.gen.dart';
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
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/select_location_from_map_controller.dart';

import '../../../../../shared_widgets/fade_circle_loading_indicator.dart';
import '../../../../../theme/app_colors.dart';
import '../../controllers/location_searching_controller/location_search_controller.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  BitmapDescriptor? _customMarker;
  BitmapDescriptor? _driverMarker;
  BitmapDescriptor? _destinationMarker;
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
          await Assets.icons.myMarker.path.toMarkerBytes(targetSize: 30);
      final Uint8List destinatioMarkerIcon =
          await Assets.icons.destinationMarker.path.toMarkerBytes();
      final Uint8List driverMarkerIcon =
          await Assets.icons.truckMarker.path.toMarkerBytes();

      _customMarker = BitmapDescriptor.fromBytes(markerIcon);
      _destinationMarker = BitmapDescriptor.fromBytes(destinatioMarkerIcon);
      _driverMarker = BitmapDescriptor.fromBytes(driverMarkerIcon);
      setState(() {}); // Trigger rebuild when marker is loaded
    } catch (e) {
      debugPrint('Error loading custom marker: $e');
      _customMarker =
          BitmapDescriptor.defaultMarker; // Fallback to default marker
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
                8.verticalSpace,
                TextButton(
                  onPressed: () {
                    ref.read(mapControllerProvider.notifier).updateLocation();
                  },
                  child: const Text("Retry"),
                )
              ],
            ),
          );
        }

        return GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          onTap: isSelectLocationFromMap&&!mapController.orderActive
              ? (LatLng latLng) async {
                  await mapController.setCurrentLocation(latLng);
                  mapController.mapController?.animateCamera(
                      // CameraUpdate.newLatLngZoom(latLng, 14),

                      CameraUpdate.newCameraPosition(
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
                icon: _destinationMarker ??
                    BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueOrange),
              ),
            if (mapController.driverPoint != null)
              Marker(
                markerId: const MarkerId("driver"),
                position: mapController.driverPoint!,
                icon: _driverMarker ??
                    BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue), // or a custom truck icon
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
          // myLocationEnabled: false,
          onMapCreated: (controller) {
            mapController.setMapController(controller);
            
            // Reload custom marker if it's null
            
            // if (_customMarker == null) {
            //   _loadCustomMarker();
            // }
          },
        );
      },
      loading: () {
        return const Center(child: FadeCircleLoadingIndicator());
      },
      error: (error, _) => InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, color: AppColors.primary),
              4.verticalSpace,
              Text("Error: $error"),
            ],
          ),
        ),
      ),
    );
  }
}
