import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/models/bottom_navigator_item.model.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/tourist/presentation/views/phone/itinerary.view.dart';
import 'package:way24/features/tourist/presentation/views/phone/list_site_tourist.view.dart';

/// pack tourist phone view
class PackageTouristPhoneView extends ConsumerStatefulWidget {
  /// pack tourist phone view
  const PackageTouristPhoneView({required this.idPackageTourist, super.key});

  /// pack tourist id
  final String idPackageTourist;

  @override
  ConsumerState<PackageTouristPhoneView> createState() =>
      _PackageTouristPhoneViewState();
}

class _PackageTouristPhoneViewState
    extends ConsumerState<PackageTouristPhoneView> {
  late final List<bool> _activated = List<bool>.filled(5, false);
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    _activated[currentTab] = true;
    final bottomNavItems = [
      BottomNavigatorItemModel(icon: Icons.map, label: 'kHome', index: 0),
      BottomNavigatorItemModel(icon: Icons.route, label: 'kProfile', index: 1),
      BottomNavigatorItemModel(
        icon: Icons.notifications,
        label: 'Notificaciones',
        index: 2,
      ),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: [
          if (_activated[0]) const ListSiteTouristPhoneView(),
          if (_activated[1]) const ItineraryPhoneView(),
          if (_activated[2])
            const SizedBox.shrink()
          else
            const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(
          Spacing.spaceMedium,
          Spacing.spaceMedium,
          Spacing.spaceMedium,
          Spacing.spaceExtraLarge,
        ),
        height: kToolbarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.spaceMedium),
          color: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...bottomNavItems.map(
              (bottomNavItem) => Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = bottomNavItem.index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Icon(
                          bottomNavItem.icon,
                          color: bottomNavItem.index == currentTab
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: .4),
                          size: Spacing.spaceExtraLarge,
                        ),
                      ),
                      // TextB2(text: bottomNavItem.label),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
