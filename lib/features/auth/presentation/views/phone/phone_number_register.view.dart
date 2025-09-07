import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/core/presentation/widgets/custom_modal.widget.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';

/// View of phone Sign in
class PhoneNumberRegisterView extends ConsumerStatefulWidget {
  /// view of phone Sign in
  const PhoneNumberRegisterView({super.key});

  @override
  ConsumerState<PhoneNumberRegisterView> createState() =>
      _SignInPhoneViewState();
}

class _SignInPhoneViewState extends ConsumerState<PhoneNumberRegisterView> {
  TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInEmailPassowrdState = ref.watch(signInEmailPassowrdProvider);
    ref.listen(signInEmailPassowrdProvider.select((value) => value), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (message) {
          customModal(context, message, kClose.i18n);
        },
        data: (user) {
          HomeRoute().go(context);
        },
      );
    });
    return PopScope(
      canPop: false,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      const VerticalSpacerSmall(),
                      // Logo
                      SlideAnimation(
                        duration: 900,
                        offsetStart: const Offset(0, -200),
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: kToolbarHeight / 2,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: MediaQuery.of(context).size.width / 4.5,
                            child: CustomPaint(
                              size: const Size(160, 160),
                              painter: LogoCP(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Titulo
                      TextH1(text: kTitle.i18n),
                      const VerticalSpacerSmall(),
                      // Mensaje
                      TextB1(text: kSignInMessage.i18n),
                      const VerticalSpacerSmall(),
                      TextfieldPhone(
                        hint: kEnterYourPhone.i18n,
                        controller: phoneController,
                      ),

                      const VerticalSpacerMedium(),
                      //* Olvidaste tu contraseña?
                      GestureDetector(
                        onTap: () {
                          ForgotPasswordRoute().push<BuildContext>(context);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextB1(
                            text: kForgotPassword.i18n,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                width: double.infinity,
                child: signInEmailPassowrdState.maybeWhen(
                  loading: () => const ButtonV1Loading(),
                  orElse: () => ButtonV1(
                    text: kLogin.i18n,
                    onPressed: () {
                      if (phoneController.text.trim().isEmpty ||
                          phoneController.text.trim().length < 9) {
                        customModal(
                          context,
                          ErrorMapping(
                            messageError: kMessageEmptyPhone.i18n,
                            painter: WarningCP(),
                            titleError: kAlert.i18n,
                          ),
                          kClose.i18n,
                        );
                        return;
                      }
                      // ref
                      //     .read(signInEmailPassowrdProvider.notifier)
                      //     .signInEmailPassword(
                      //       emailController.text,
                      //       passwordController.text,
                      //     );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                width: double.infinity,
                child: ButtonV1B(
                  onPressed: () {
                    SignUpRoute().push<BuildContext>(context);
                  },
                  text: kNotHaveAccount.i18n,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
