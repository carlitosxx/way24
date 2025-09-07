import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/widgets/custom_modal.widget.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/auth/presentation/providers/validations.provider.dart';
import 'package:way24/features/auth/presentation/widgets/button_numeric.widget.dart';
import 'package:way24/features/auth/presentation/widgets/field_otp.widget.dart';

///Verify Otp code phone view
class VerifyOtpCodePhoneView extends ConsumerStatefulWidget {
  ///Verify Otp code phone view
  const VerifyOtpCodePhoneView({
    required this.email,
    required this.typeVerify,
    super.key,
  });

  /// Email address
  final String email;

  /// type verify
  final String typeVerify;

  @override
  ConsumerState<VerifyOtpCodePhoneView> createState() =>
      _VerifyOtpCodePhoneViewState();
}

class _VerifyOtpCodePhoneViewState
    extends ConsumerState<VerifyOtpCodePhoneView> {
  @override
  Widget build(BuildContext context) {
    final codes = ref.watch(numbersOTPProvider);
    final isEnableTextbutton = ref.watch(enableButtonResendProvider);
    final validateOtpState = ref.watch(validateOtpProvider);
    final sendOtpPasswordResetState = ref.watch(sendOtpPasswordResetProvider);

    //Listeners
    ref
      ..listen(sendOtpPasswordResetProvider.select((value) => value), (
        previous,
        next,
      ) {
        next.whenOrNull(
          data: () => ref
              .read(
                countDownControllerProvider(
                  const Duration(seconds: 60),
                ).notifier,
              )
              .resetTimer(initialDuration: const Duration(seconds: 60)),
          error: (message) => customModal(context, message, kClose.i18n),
        );
      })
      ..listen(validateOtpProvider.select((value) => value), (previous, next) {
        next.whenOrNull(
          error: (message) => customModal(context, message, kClose.i18n),
          data: (verifyPhoneEntity) {
            if (widget.typeVerify == 'recovery') {
              return CreateNewPasswordRoute().go(context);
            }
            HomeRoute().go(context);
          },
        );
      });
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kTitleVerifyEmail.i18n)),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Imagen de candado
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                    radius: MediaQuery.of(context).size.width / 5,
                    child: CustomPaint(
                      size: const Size(50, 60),
                      painter: PadlockCP(),
                    ),
                  ),
                ),
                // Mensaje
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: TextB1(
                    text: kMessageEnterYourCode.i18n.fill([widget.email]),
                    textAlign: TextAlign.center,
                  ),
                ),
                // 4 campos para el codigo OTP
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (i) => FieldOTPWidget(index: i)),
                  ),
                ),
                // Pad numerico
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => ButtonNumericWidget(number: index + 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => ButtonNumericWidget(number: index + 4),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => ButtonNumericWidget(number: index + 7),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextButton(
                            onPressed: null,
                            child: SizedBox.shrink(),
                          ),
                          const ButtonNumericWidget(number: 0),
                          TextButton(
                            onPressed: () {
                              if (codes.isNotEmpty) {
                                ref.read(numbersOTPProvider.notifier).update((
                                  state,
                                ) {
                                  final newString = state.substring(
                                    0,
                                    state.length - 1,
                                  );
                                  return newString;
                                });
                              }
                            },
                            child: const Icon(Icons.backspace_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Mensaje de pregunta y boton para reenviar codigo OTP
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextB1(
                        text: kDidntReceiveCode.i18n,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      sendOtpPasswordResetState.maybeWhen(
                        orElse: () => TextButton(
                          onPressed: isEnableTextbutton
                              ? () {
                                  ref
                                      .read(
                                        sendOtpPasswordResetProvider.notifier,
                                      )
                                      .sendOtpPasswordReset(widget.email);
                                }
                              : null,
                          child: TextB1(
                            text: kResend.i18n,
                            color: isEnableTextbutton
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                        loading: () => const TextButton(
                          onPressed: null,
                          child: LoadingWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Mensaje de cuenta regresiva para volver a reenviar codigo
                const TextCountDown(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        width: double.infinity,
        child: validateOtpState.maybeWhen(
          loading: () => const ButtonV1Loading(),
          orElse: () => SlideAnimation(
            duration: 500,
            offsetStart: const Offset(0, 100),
            child: ButtonV1(
              text: kNext.i18n,
              onPressed: codes.length == 6
                  ? () {
                      ref
                          .read(validateOtpProvider.notifier)
                          .validateOtp(widget.email, codes, widget.typeVerify);
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

///Text countdown
class TextCountDown extends ConsumerWidget {
  /// this represent a text countdown
  const TextCountDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countDownNumber = ref
        .watch(countDownControllerProvider(const Duration(seconds: 60)))
        .inSeconds;
    return TextB1(text: kCanResendIn.i18n.fill([countDownNumber]));
  }
}
