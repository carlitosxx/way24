import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/tourist/domain/entities/tire_repair_shop.entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// Custom draggable sheet
class CustomDraggableSheetTireRepair extends StatefulWidget {
  /// Custom draggable sheet
  const CustomDraggableSheetTireRepair({
    required this.listTireRepair,
    super.key,
  });

  /// list carriers
  final List<TireRepairShopEntity> listTireRepair;
  @override
  State<CustomDraggableSheetTireRepair> createState() =>
      _CustomDraggableSheetTireRepairState();
}

class _CustomDraggableSheetTireRepairState
    extends State<CustomDraggableSheetTireRepair> {
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
                      itemCount: widget.listTireRepair.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: TextH4(
                            text: widget.listTireRepair[index].name,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextB1(
                                text: widget.listTireRepair[index].address,
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
                                      widget.listTireRepair[index].phoneNumber,
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
                                latitude: widget.listTireRepair[index].latitude,
                                longitude:
                                    widget.listTireRepair[index].longitude,
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
