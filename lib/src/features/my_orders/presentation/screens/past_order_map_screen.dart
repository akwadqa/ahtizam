import 'dart:math' as math;
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:geolocator/geolocator.dart';

import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
@RoutePage()
class PastOrderMapScreen extends StatefulWidget {
  const PastOrderMapScreen({super.key});

  @override
  State<PastOrderMapScreen> createState() => _PastOrderMapScreenState();
}

class _PastOrderMapScreenState extends State<PastOrderMapScreen> {
  GoogleMapController? _controller;
  LatLng? userLocation;
  LatLng? destinationLocation;
  List<LatLng> _polylineCoordinates = [];
  String locationAddress = "";
  final PolylinePoints _polylinePoints = PolylinePoints();
  BitmapDescriptor? _userMarker;
  BitmapDescriptor? _userDestinationMarker;

 
  @override
  void initState() {
    super.initState();
    _initTestMap();
    _generateDotMarkers();

  }

 Future<void> _generateDotMarkers() async {
    _userMarker = await createCircleMarker(Colors.black, size: 35);
    _userDestinationMarker = await createCircleMarker(AppColors.primary, size: 40);
    setState(() {});
  }


  Future<void> _initTestMap() async {
    final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final base = LatLng(pos.latitude, pos.longitude);

    // Offset: +1km NE for user, +2km SW for destination
    userLocation = _offsetLatLng(base, 1, 45);
    destinationLocation = _offsetLatLng(base, 2, 225);

    await _getPolyline();

    setState(() {}); // trigger rebuild after locations are set
  }

  Future<void> _getPolyline() async {
    if (userLocation == null || destinationLocation == null) return;

    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      ServicesUrls.mapApiKey,
      PointLatLng(userLocation!.latitude, userLocation!.longitude),
      PointLatLng(destinationLocation!.latitude, destinationLocation!.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      setState(() {
        _polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  LatLng _offsetLatLng(LatLng origin, double distanceKm, double bearingDegrees) {
    const double earthRadiusKm = 6371.0;
    final double bearingRad = bearingDegrees * (math.pi / 180.0);
    final double lat1 = origin.latitude * (math.pi / 180.0);
    final double lon1 = origin.longitude * (math.pi / 180.0);
    final double distanceRad = distanceKm / earthRadiusKm;

    final double lat2 = math.asin(math.sin(lat1) * math.cos(distanceRad) +
        math.cos(lat1) * math.sin(distanceRad) * math.cos(bearingRad));
    final double lon2 = lon1 +
        math.atan2(
            math.sin(bearingRad) * math.sin(distanceRad) * math.cos(lat1),
            math.cos(distanceRad) - math.sin(lat1) * math.sin(lat2));

    return LatLng(lat2 * (180 / math.pi), lon2 * (180 / math.pi));
  }

  @override
  Widget build(BuildContext context) {
    if (userLocation == null || destinationLocation == null) {
      return const Scaffold(
        body: Center(child: FadeCircleLoadingIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: userLocation!,
              zoom: 14,
            ),
            myLocationEnabled: false,
            onMapCreated: (controller) {
              _controller = controller;
               
            },
            markers: {
              // if (mapController.userLocation != null)
              Marker(
                markerId: const MarkerId("userLocation"),
                position:userLocation!,
                icon: _userMarker!,
              ),
            // if (mapController.destination != null)
              Marker(
                markerId: const MarkerId("destination"),
                position: destinationLocation!,
                icon: _userDestinationMarker!,
              ),
            
            },
            polylines: {
              if (_polylineCoordinates.isNotEmpty)
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: _polylineCoordinates,
                  color: AppColors.primary,
                  width: 4,
                ),
            },
          ),
        PositionedDirectional(
          top: 40,
          start: 20,
          child: SizedBox(
            height: 60,
            width: 60,
            child: CustomBackArrowWidget()),)
        ],
      ),
    );
  }
}
