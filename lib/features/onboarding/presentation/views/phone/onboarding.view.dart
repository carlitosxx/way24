import 'dart:async';
import 'dart:ui' as ui;
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/onboarding/presentation/models/onboard.model.dart';
import 'package:way24/features/onboarding/presentation/onboarding.i18n.dart';
import 'package:way24/features/onboarding/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/onboarding/presentation/providers/onboarding.provider.dart';
import 'package:way24/features/onboarding/presentation/widgets/dot_indicator.widget.dart';
import 'package:way24/features/onboarding/presentation/widgets/onboarding_content.widget.dart';

/// on boarding phone view
class OnBoardingPhoneView extends ConsumerStatefulWidget {
  /// on boarding phone view
  const OnBoardingPhoneView({super.key});

  @override
  ConsumerState<OnBoardingPhoneView> createState() =>
      _OnBoardingPhoneViewState();
}

class _OnBoardingPhoneViewState extends ConsumerState<OnBoardingPhoneView> {
  /// page controller
  late PageController _pageController;

  /// Current page in type data double, from 0.0 to 2.0(3 pages)
  double currentPage = 0;
  ui.Image? _image;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    _loadImage('assets/imgs/oasis.jpg');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadImage(String assetPath) async {
    final image = await loadImageFromAsset(assetPath);
    setState(() {
      _image = image;
    });
  }

  Future<ui.Image> loadImageFromAsset(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final completer = Completer<ui.Image>();

    ui.decodeImageFromList(bytes, completer.complete);

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final pageIndexState = ref.watch(pageIndexProvider);

    final listOnboard = [
      Onboard(
        title: kTitle1.i18n,
        message: kDescription1.i18n,
        image: 'assets/imgs/oasis.jpg',
      ),
      Onboard(
        title: kTitle2.i18n,
        message: kDescription2.i18n,
        image: 'assets/imgs/macchu.jpg',
      ),
      Onboard(
        title: kTitle3.i18n,
        message: kDescription3.i18n,
        image: 'assets/imgs/alpaca.jpg',
      ),
      Onboard(
        title: kTitle4.i18n,
        message: kDescription4.i18n,
        image: 'assets/imgs/cuadrilla_2.jpg',
      ),
    ];
    final listOnboardLength = listOnboard.length.toDouble() - 1;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: (details) {
        _pageController.jumpTo(
          _pageController.position.pixels - details.primaryDelta!,
        );
      },
      onHorizontalDragEnd: (details) async {
        if (details.primaryVelocity! < 0) {
          if (_pageController.page! < listOnboardLength) {
            await _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        } else if (details.primaryVelocity! > 0) {
          if (_pageController.page! > 0) {
            await _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            TextH1(text: kBrand.i18n, fontWeight: FontWeight.bold),
            const VerticalSpacerMedium(),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: CustomPaint(
                  key: ValueKey(_image),
                  size: const Size(250, 250),
                  painter: _image != null ? LogoCP2(image: _image!) : null,
                ),
              ),
            ),
            const VerticalSpacerMedium(),
            SizedBox(
              height: 120,
              child: PageView.builder(
                controller: _pageController,
                itemCount: listOnboard.length,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) async {
                  ref.read(pageIndexProvider.notifier).update((state) => index);
                  await _loadImage(listOnboard[index].image);
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(onboard: listOnboard[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    listOnboard.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: DotIndicator(isActive: index == pageIndexState),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        floatingActionButton: pageIndexState == listOnboardLength
            ? FloatingActionButton(
                onPressed: () {
                  ref
                      .read(saveSeenOnboardingNotifierProvider.notifier)
                      .saveSeenOnboarding();
                  SignInRoute().go(context);
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            : null,
      ),
    );
  }
}
