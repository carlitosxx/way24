import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/models/bottom_navigator_item.model.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/home/presentation/home.i18n.dart';
import 'package:way24/features/home/presentation/views/phone/home_detail.view.dart';
import 'package:way24/features/profile/presentation/views/phone/profile.view.dart';

/// Home phone view
class HomePhoneView extends ConsumerStatefulWidget {
  /// Home phone view
  const HomePhoneView({super.key});

  @override
  ConsumerState<HomePhoneView> createState() => _HomePhoneViewState();
}

class _HomePhoneViewState extends ConsumerState<HomePhoneView> {
  late final List<bool> _activated = List<bool>.filled(5, false);
  int currentTab = 0;
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/imgs/400x200.jpg'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _activated[currentTab] = true;
    final bottomNavItems = [
      BottomNavigatorItemModel(
        icon: Icons.home_filled,
        label: kHome.i18n,
        index: 0,
      ),
      BottomNavigatorItemModel(
        icon: Icons.person,
        label: kProfile.i18n,
        index: 1,
      ),
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
          if (_activated[0]) const HomeDetailPhoneView(),
          if (_activated[1]) const ProfilePhoneView(),
          if (_activated[2])
            const SizedBox.shrink()
          else
            const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(Spacing.spaceMedium),
        height: kToolbarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.spaceMedium),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
                                ).colorScheme.primary.withOpacity(0.4),
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
