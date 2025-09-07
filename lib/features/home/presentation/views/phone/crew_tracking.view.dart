import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';

/// Crew tracking phone view
class CrewTrackingPhoneView extends ConsumerStatefulWidget {
  /// Crew tracking phone view
  const CrewTrackingPhoneView({super.key});

  @override
  ConsumerState<CrewTrackingPhoneView> createState() =>
      _CrewTrackingPhoneViewState();
}

class _CrewTrackingPhoneViewState extends ConsumerState<CrewTrackingPhoneView> {
  final MapController _mapController = MapController();
  bool counter = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getUserLocationStreamNotifierProvider);
    return Scaffold(
      body: state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (latlng) {
          if (counter) {
            _animateCamera(latlng);
          }
          counter = true;
          return FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: latlng,
              initialZoom: 18,
              maxZoom: 20,
              minZoom: 14,
              initialRotation: 56.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 100,
                    height: 100,
                    point: latlng,
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
                  child: const CircleAvatar(
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error) => Center(child: Text(error.messageError)),
      ),
    );
  }

  // Función para animar la cámara
  void _animateCamera(LatLng newLocation) {
    _mapController.move(newLocation, 18);
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
