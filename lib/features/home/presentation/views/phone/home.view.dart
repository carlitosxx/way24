import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/onboarding/presentation/widgets/dot_indicator.widget.dart';
import 'package:way24/features/tourist/presentation/providers/injects_container.provider.dart';

/// Home phone view
class HomePhoneView extends ConsumerStatefulWidget {
  /// Home phone view
  const HomePhoneView({super.key});

  @override
  ConsumerState<HomePhoneView> createState() => _HomePhoneViewState();
}

class _HomePhoneViewState extends ConsumerState<HomePhoneView> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateListTouristPackages = ref.watch(
      getTouristPackagesNotifierProvider,
    );
    return Scaffold(
      backgroundColor: Colors.black26,
      body: stateListTouristPackages.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        initial: () => const Center(child: Text('initial')),
        data: (listTouristPackages) {
          return Stack(
            children: [
              // Background image with animation
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: CachedNetworkImage(
                  imageUrl:
                      listTouristPackages[_currentIndex %
                              listTouristPackages.length]
                          .image,
                  key: ValueKey<int>(_currentIndex),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),

              // background dark gradient
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300, // Altura del fondo oscuro
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.black.withValues(alpha: 0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // page view with tourist packages
              PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index % listTouristPackages.length;
                  });
                },
                itemBuilder: (context, index) {
                  final realIndex = index % listTouristPackages.length;
                  return Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 150),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextH1(
                          text: listTouristPackages[realIndex].title,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        const VerticalSpacerSmall(),
                        Text(
                          listTouristPackages[realIndex].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalSpacerSmall(),
                      ],
                    ),
                  );
                },
              ),

              /// Dots indicators
              Positioned(
                bottom: 130,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      listTouristPackages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: DotIndicator(
                          isActive: index == _currentIndex,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Button to buy the package
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: listTouristPackages[_currentIndex].isPurchased
                      ? GestureDetector(
                          onTap: () {
                            ref
                                .read(getTouristSitesNotifierProvider.notifier)
                                .getTouristSistes(
                                  listTouristPackages[_currentIndex].id,
                                );
                            PackageTouristRoute(
                              idPackageTourist:
                                  listTouristPackages[_currentIndex].image,
                            ).push<BuildContext>(context);
                          },
                          child: const CircleAvatar(
                            key: ValueKey('arrow'),
                            radius: 35,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 48,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () => CartRoute().push<BuildContext>(context),
                          child: CircleAvatar(
                            key: const ValueKey('buy'),
                            radius: 35,
                            backgroundColor: Colors.grey.withValues(alpha: 0.5),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Text(
                                'S/${listTouristPackages[_currentIndex].price}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),

              /// Menu button
              Positioned(
                top: kToolbarHeight,
                left: Spacing.spaceLarge,
                child: GestureDetector(
                  onTap: () => {MenuHomeRoute().push<BuildContext>(context)},
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF191C1E),
                    child: Icon(Icons.menu_sharp, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
        error: (e) => Center(child: Text(e.messageError)),
      ),
    );
  }
}
