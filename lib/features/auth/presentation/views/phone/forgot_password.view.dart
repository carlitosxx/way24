import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/core/presentation/widgets/custom_modal.widget.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';

/// Forgot password phone view
class ForgotPasswordPhoneView extends ConsumerStatefulWidget {
  /// Forgot password phone view
  const ForgotPasswordPhoneView({super.key});

  @override
  ConsumerState<ForgotPasswordPhoneView> createState() =>
      _ForgotPasswordPhoneViewState();
}

class _ForgotPasswordPhoneViewState
    extends ConsumerState<ForgotPasswordPhoneView> {
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sendOtpPasswordResetState = ref.watch(sendOtpPasswordResetProvider);
    ref.listen(sendOtpPasswordResetProvider.select((value) => value), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (message) {
          customModal(context, message, kClose.i18n);
        },
        data: () {
          VerifyOtpRoute(
            email: emailController.text,
            typeVerify: 'recovery',
          ).push<BuildContext>(context);
        },
      );
    });
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kTitleForgotPassword.i18n)),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  const VerticalSpacerSmall(),
                  //Logo
                  Container(
                    padding: const EdgeInsets.only(bottom: kToolbarHeight / 2),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                      radius: MediaQuery.of(context).size.width / 4.5,
                      child: CustomPaint(
                        size: const Size(70, 80),
                        painter: PadlockCP(),
                      ),
                    ),
                  ),
                  // Mensaje
                  TextB1(
                    text: kRecieveVerificationCode.i18n,
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpacerSmall(),
                  // Textfield correo
                  TextfieldEmail(
                    hint: kEnterYourEmail.i18n,
                    controller: emailController,
                  ),
                  const VerticalSpacerMedium(),
                ],
              ),
            ),
          ),
          // Mensaje
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        width: double.infinity,
        child: sendOtpPasswordResetState.maybeWhen(
          loading: () => const ButtonV1Loading(),
          orElse: () => ButtonV1(
            text: kSendEmail.i18n,
            onPressed: () {
              if (emailController.text.trim().isEmpty) {
                customModal(
                  context,
                  ErrorMapping(
                    messageError: kMessageEmptyFields.i18n,
                    painter: WarningCP(),
                    titleError: kAlert.i18n,
                  ),
                  kClose.i18n,
                );
                return;
              }
              ref
                  .read(sendOtpPasswordResetProvider.notifier)
                  .sendOtpPasswordReset(emailController.text);
            },
          ),
        ),
      ),
    );
  }
}
