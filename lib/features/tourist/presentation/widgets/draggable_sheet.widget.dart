import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/tourist/domain/entities/carriers.entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// Custom draggable sheet
class CustomDraggableSheet extends StatefulWidget {
  /// Custom draggable sheet
  const CustomDraggableSheet({required this.listCarriers, super.key});

  /// list carriers
  final List<CarrierEntity> listCarriers;
  @override
  State<CustomDraggableSheet> createState() => _CustomDraggableSheetState();
}

class _CustomDraggableSheetState extends State<CustomDraggableSheet> {
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
        // Cierra el modal al tocar fuera
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
                      itemCount: widget.listCarriers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: TextH4(text: widget.listCarriers[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextB1(text: widget.listCarriers[index].address),
                              const VerticalSpacerSmall(),
                              ...widget.listCarriers[index].listServiceTransport
                                  .map((service) {
                                    return TextB2(
                                      text:
                                          '🚗 ${service.vehicle}: S/ ${service.price}',
                                    );
                                  }),
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
                                      widget.listCarriers[index].phoneNumber,
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
                                latitude: widget.listCarriers[index].latitude,
                                longitude: widget.listCarriers[index].longitude,
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
