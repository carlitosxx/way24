import 'dart:ui';

import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/home/presentation/home.i18n.dart';

/// Menu Home Phone View
class MenuHomePhoneView extends ConsumerStatefulWidget {
  /// Menu Home Phone View
  const MenuHomePhoneView({super.key});

  @override
  ConsumerState<MenuHomePhoneView> createState() => _MenuHomePhoneViewState();
}

class _MenuHomePhoneViewState extends ConsumerState<MenuHomePhoneView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 400),
        tween: Tween(begin: 0, end: 1),
        builder: (context, value, child) {
          return Stack(
            children: [
              /// background blur
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10 * value,
                  sigmaY: 10 * value,
                ),
                child: Container(color: Colors.black.withOpacity(0.3 * value)),
              ),

              /// close button
              Positioned(
                top: kToolbarHeight,
                left: 24,
                child: GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF191C1E),
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),

              Center(
                child: Transform.scale(
                  scale: 0.8 + (0.2 * value),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => {
                            UpdateProfileDataRoute().push<BuildContext>(
                              context,
                            ),
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TextH3(
                              text: kMyProfile.i18n,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                          child: Divider(color: Colors.white),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => {
                            MyPurchasesRoute().push<BuildContext>(context),
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TextH3(
                              text: kMyPurchases.i18n,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                          child: Divider(color: Colors.white),
                        ),
                        TextH3(text: kFAQ.i18n, color: Colors.white),
                        const SizedBox(
                          width: 250,
                          child: Divider(color: Colors.white),
                        ),
                        TextH3(text: kComplaintsBook.i18n, color: Colors.white),
                        const SizedBox(
                          width: 250,
                          child: Divider(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () => {
                            ref.read(logoutProvider.notifier).logout(),
                            SignInRoute().pushReplacement(context),
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TextH3(
                              text: kCloseSession.i18n,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
