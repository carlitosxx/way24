import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/presentation/theme/spacing.dart';

/// Map phone view
class MapPhoneView extends StatefulWidget {
  /// Map phone view
  const MapPhoneView({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;
  @override
  State<MapPhoneView> createState() => _MapPhoneViewState();
}

class _MapPhoneViewState extends State<MapPhoneView> {
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: LatLng(widget.latitude, widget.longitude),
        initialZoom: 14,
        maxZoom: 20,
        minZoom: 14,
        initialRotation: 56.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          // userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 100,
              height: 100,
              point: LatLng(widget.latitude, widget.longitude),
              child: const Icon(
                Icons.location_pin,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          ],
        ),
        Positioned(
          top: kToolbarHeight,
          left: Spacing.spaceMedium,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const CircleAvatar(child: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ],
    );
  }
}
