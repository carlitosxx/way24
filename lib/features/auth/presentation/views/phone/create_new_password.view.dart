import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/core/presentation/widgets/custom_modal.widget.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';

/// Create new password phone view
class CreateNewPasswordPhoneView extends ConsumerStatefulWidget {
  /// Create new password phone view
  const CreateNewPasswordPhoneView({super.key});

  @override
  ConsumerState<CreateNewPasswordPhoneView> createState() =>
      _CreateNewPasswordPhoneViewState();
}

class _CreateNewPasswordPhoneViewState
    extends ConsumerState<CreateNewPasswordPhoneView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createNewPasswordState = ref.watch(createNewPasswordProvider);
    ref.listen(createNewPasswordProvider.select((value) => value), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (message) {
          customModal(context, message, kClose.i18n);
        },
        data: (userId) {
          ref
              .read(getTouristPackagesNotifierProvider.notifier)
              .getTouristPackages(userId);
          HomeRoute().go(context);
        },
      );
    });
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kTitleCreateNewPassword.i18n)),
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
                    text: kMessageYourNewPassword.i18n,
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpacerSmall(),
                  // Textfield clave
                  TextfieldPassword(
                    hint: kEnterYourNewPassword.i18n,
                    controller: passwordController,
                  ),
                  const VerticalSpacerMedium(),
                  // Textfield repetir clave
                  TextfieldPassword(
                    hint: kRepeatYourNewPassword.i18n,
                    controller: repasswordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        width: double.infinity,
        child: createNewPasswordState.maybeWhen(
          loading: () => const ButtonV1Loading(),
          orElse: () => ButtonV1(
            text: kSave.i18n,
            onPressed: () {
              if (passwordController.text.trim().isEmpty ||
                  repasswordController.text.trim().isEmpty) {
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
              if (passwordController.text.trim() !=
                  repasswordController.text.trim()) {
                customModal(
                  context,
                  ErrorMapping(
                    messageError: kPasswordsNotMatch.i18n,
                    painter: WarningCP(),
                    titleError: kAlert.i18n,
                  ),
                  kClose.i18n,
                );
                return;
              }
              if (passwordController.text.length < 8) {
                customModal(
                  context,
                  ErrorMapping(
                    messageError: kMinDigitPassword.i18n,
                    painter: WarningCP(),
                    titleError: kAlert.i18n,
                  ),
                  kClose.i18n,
                );
                return;
              }

              ref
                  .read(createNewPasswordProvider.notifier)
                  .createNewPassword(passwordController.text.trim());
            },
          ),
        ),
      ),
    );
  }
}
