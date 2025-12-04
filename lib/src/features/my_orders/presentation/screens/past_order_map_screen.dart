import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';

import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
@RoutePage()
class PastOrderMapScreen extends StatefulWidget {
  final LatLng userLocation;
  final LatLng destinationLocation;

  const PastOrderMapScreen({
    super.key,
    required this.userLocation,
    required this.destinationLocation,
  });

  @override
  State<PastOrderMapScreen> createState() => _PastOrderMapScreenState();
}

class _PastOrderMapScreenState extends State<PastOrderMapScreen> {
  GoogleMapController? _controller;
  List<LatLng> _polylineCoordinates = [];
  final PolylinePoints _polylinePoints = PolylinePoints();
  BitmapDescriptor? _userMarker;
  BitmapDescriptor? _userDestinationMarker;

  @override
  void initState() {
    super.initState();
    _generateMarkers();
    _getPolyline();
  }

  Future<void> _generateMarkers() async {
    _userMarker = await createCircleMarker(Colors.black, size: 35);
    _userDestinationMarker = await createCircleMarker(AppColors.primary, size: 40);
    setState(() {});
  }

  Future<void> _getPolyline() async {
    final result = await _polylinePoints.getRouteBetweenCoordinates(
      ServicesUrls.mapApiKey,
      PointLatLng(widget.userLocation.latitude, widget.userLocation.longitude),
      PointLatLng(widget.destinationLocation.latitude, widget.destinationLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      _polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userMarker == null || _userDestinationMarker == null) {
      return const Scaffold(
        body: Center(child: FadeCircleLoadingIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.userLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) => _controller = controller,
            markers: {
              Marker(
                markerId: const MarkerId("user"),
                position: widget.userLocation,
                icon: _userMarker!,
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: widget.destinationLocation,
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
            child: const SizedBox(
              height: 60,
              width: 60,
              child: CustomBackArrowWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
