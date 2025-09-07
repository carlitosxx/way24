import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/tourist/tourist.i18n.dart';
import 'package:timeline_tile/timeline_tile.dart';

/// Itinerary phone view
class ItineraryPhoneView extends StatefulWidget {
  /// Itinerary phone view
  const ItineraryPhoneView({super.key});

  @override
  State<ItineraryPhoneView> createState() => _ItineraryPhoneViewState();
}

class _ItineraryPhoneViewState extends State<ItineraryPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(kItinerary.i18n),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Spacing.spaceMedium,
                Spacing.spaceMedium,
                Spacing.spaceMedium,
                Spacing.spaceZero,
              ),
              child: DropdownButtonFormField(
                value: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: .1),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('1 persona Adulto (Pringstom)'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('1 persona Adulto (Carlos Aguirre)'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('1 persona Adulto (Katy Solis)'),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text('1 persona Adulto (Juan Pérez)'),
                  ),
                ],
                onChanged: (value) {
                  print(value);
                  print('esto es un print');
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spaceMedium,
            ),
            sliver: SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // Time line
                return TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.15,
                  isFirst: index == 0,
                  isLast: index == 9,
                  beforeLineStyle: LineStyle(
                    thickness: 2,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      iconData: Icons.check_outlined,
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  startChild: Container(
                    padding: const EdgeInsetsDirectional.only(
                      top: Spacing.spaceExtraLarge,
                    ),
                    child: Column(
                      children: [
                        TextB1(text: 'Day 1'),
                        TextB2(text: '10:50'),
                      ],
                    ),
                  ),
                  endChild: Container(
                    padding: const EdgeInsets.only(
                      left: Spacing.spaceSmall,
                      top: Spacing.spaceExtraLarge,
                    ),
                    child: const Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextB1(
                            text: 'Desayuno',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextB2(
                            text:
                                'Vamos a desayunar a las 10:50 en el hotel, '
                                'salimos a las 11:30 para el tour. Luego de eso'
                                ' vamos a almorzar a las 13:00 en el'
                                ' restaurante.',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
