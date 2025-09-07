import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/tourist/domain/entities/gas_station.entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// Custom draggable sheet
class CustomDraggableSheetGasStation extends StatefulWidget {
  /// Custom draggable sheet
  const CustomDraggableSheetGasStation({
    required this.listGasStation,
    super.key,
  });

  /// list carriers
  final List<GasStationEntity> listGasStation;
  @override
  State<CustomDraggableSheetGasStation> createState() =>
      _CustomDraggableSheetGasStationState();
}

class _CustomDraggableSheetGasStationState
    extends State<CustomDraggableSheetGasStation> {
  bool hasCallSupport = false;
  Future<void>? launched;
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // close the modal
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Container(color: Colors.transparent),
        ),
        // modal
        DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.8,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Handle personalizado
                  Container(
                    width: 80,
                    height: 7,
                    margin: const EdgeInsets.only(top: 10, bottom: 18),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // Contenido del modal
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.listGasStation.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: TextH4(
                            text: widget.listGasStation[index].name,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextB1(
                                text: widget.listGasStation[index].address,
                              ),
                              const VerticalSpacerSmall(),
                              // ...widget.listCarriers[index].
                              //     .map((service) {
                              //   return TextB2(
                              //     text:
                              //         '🚗 ${service.vehicle}: S/ ${service.price}',
                              //   );
                              // }),
                            ],
                          ),
                          leading: IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                            ),
                            onPressed: hasCallSupport
                                ? () => setState(() {
                                    launched = _makePhoneCall(
                                      widget.listGasStation[index].phoneNumber,
                                    );
                                  })
                                : null,
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.location_on,
                              // color: Colors.blue,
                            ),
                            onPressed: () {
                              MapRoute(
                                latitude: widget.listGasStation[index].latitude,
                                longitude:
                                    widget.listGasStation[index].longitude,
                              ).push<BuildContext>(context);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
