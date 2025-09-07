import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/utils/capitalize_first_letter.util.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/core/presentation/utils/is_adult.util.dart';
import 'package:way24/core/presentation/widgets/custom_modal.widget.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/auth/presentation/providers/validations.provider.dart';
import 'package:way24/features/auth/presentation/widgets/date_birth_picker.widget.dart';

/// View of phone Sign up
class SignUpPhoneView extends ConsumerStatefulWidget {
  /// view of phone Sign up
  const SignUpPhoneView({super.key});

  @override
  ConsumerState<SignUpPhoneView> createState() => _SignUpPhoneViewState();
}

class _SignUpPhoneViewState extends ConsumerState<SignUpPhoneView> {
  /// Constrolador del textfield del nombre
  final firstNameController = TextEditingController();

  /// Constrolador del textfield del apellido
  final lastNameController = TextEditingController();

  /// Controlador del textfield del correo
  final emailController = TextEditingController();

  /// Controlador del textfield de la contraseña
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleSignUpPressed(BuildContext context, WidgetRef ref) {
    // Validation all fields
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
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
    // Validation min digit password
    if (passwordController.text.trim().length < 8) {
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
    final dateOfBirth = ref.read(dateOfBirthProvider);
    if (dateOfBirth == null) {
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
    if (!isAdult(dateOfBirth)) {
      customModal(
        context,
        ErrorMapping(
          messageError: kMessageAdult.i18n,
          painter: WarningCP(),
          titleError: kAlert.i18n,
        ),
        kClose.i18n,
      );
      return;
    }

    final hasAcceptedTerms = ref.read(hasAcceptedTermsProvider);
    if (!hasAcceptedTerms) {
      customModal(
        context,
        ErrorMapping(
          messageError: kTermsMessageError.i18n,
          painter: WarningCP(),
          titleError: kAlert.i18n,
        ),
        kClose.i18n,
      );
      return;
    }

    ref
        .read(createNewAccountProvider.notifier)
        .createNewAccount(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          passwordController.text,
          dateOfBirth,
        );
  }

  @override
  Widget build(BuildContext context) {
    final hasAcceptedTerms = ref.watch(hasAcceptedTermsProvider);
    final createNewAccountState = ref.watch(createNewAccountProvider);
    ref.listen(createNewAccountProvider.select((value) => value), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (message) {
          customModal(context, message, kClose.i18n);
        },
        data: () {
          VerifyOtpRoute(
            email: emailController.text.trim(),
            typeVerify: 'signUp',
          ).push<BuildContext>(context);
        },
      );
    });
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kTitleSignup.i18n)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                      radius: MediaQuery.of(context).size.width / 5,
                      child: CustomPaint(
                        size: const Size(50, 60),
                        painter: ProfileCP(),
                      ),
                    ),
                  ),

                  // Message
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    child: TextB1(
                      text: kMessageRequireInformation.i18n,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Textfield Name
                  TextfieldName(
                    hint: kFirstName.i18n,
                    controller: firstNameController,
                    onChanged: (text) {
                      firstNameController
                        ..text = text.replaceAll(RegExp(r'\s+'), ' ')
                        ..text = capitalizeFirstLetter(
                          firstNameController.text,
                        );
                      final wordCountFirstName = firstNameController.text
                          .trim()
                          .split(' ');

                      if (wordCountFirstName.length >= 4) {
                        firstNameController.text = wordCountFirstName
                            .take(4)
                            .join(' ');
                      }
                    },
                  ),
                  const VerticalSpacerMedium(),
                  // Textfield Last Name
                  TextfieldName(
                    hint: kLastName.i18n,
                    controller: lastNameController,
                    onChanged: (text) {
                      lastNameController
                        ..text = text.replaceAll(RegExp(r'\s+'), ' ')
                        ..text = capitalizeFirstLetter(lastNameController.text);
                      final wordCountLastName = lastNameController.text
                          .trim()
                          .split(' ');
                      if (wordCountLastName.length >= 5) {
                        lastNameController.text = wordCountLastName
                            .take(5)
                            .join(' ');
                      }
                    },
                  ),
                  const VerticalSpacerMedium(),

                  // Textfield date of birth picker
                  DateBirthPicker(ref: ref),

                  const VerticalSpacerMedium(),
                  // Textfield email
                  TextfieldEmail(
                    hint: kEnterYourEmail.i18n,
                    controller: emailController,
                  ),
                  const VerticalSpacerMedium(),
                  // Textfield password
                  TextfieldPassword(
                    hint: kEnterYourPassword.i18n,
                    controller: passwordController,
                  ),
                  // Checkbox terms and conditions
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: hasAcceptedTerms,
                    onChanged: (val) {
                      ref
                          .read(hasAcceptedTermsProvider.notifier)
                          .update((state) => !state);
                    },
                    title: TextB1(text: kHasAcceptedTerms.i18n),
                    controlAffinity: ListTileControlAffinity.leading,
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
        child: createNewAccountState.maybeWhen(
          loading: () => const ButtonV1Loading(),
          orElse: () => ButtonV1(
            text: kCreateAnAccount.i18n,
            onPressed: () => _handleSignUpPressed(context, ref),
          ),
        ),
      ),
    );
  }
}
