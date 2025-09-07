import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/profile/presentation/profile.i18n.dart';
import 'package:way24/features/profile/presentation/providers/injects_container.provider.dart';

/// Update profile data phone view
class UpdateProfileDataPhoneView extends ConsumerStatefulWidget {
  /// Update profile data phone view
  const UpdateProfileDataPhoneView({super.key});

  @override
  ConsumerState<UpdateProfileDataPhoneView> createState() =>
      _UpdateProfileDataPhoneViewState();
}

class _UpdateProfileDataPhoneViewState
    extends ConsumerState<UpdateProfileDataPhoneView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSessionState = ref.watch(getProfileDataProvider);
    final saveProfileState = ref.watch(saveProfileProvider);
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kMyProfile.i18n)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Spacing.spaceLarge,
                Spacing.spaceMedium,
                Spacing.spaceLarge,
                Spacing.spaceLarge,
              ),
              child: currentSessionState.when(
                data: (profileEntity) {
                  phoneController.text = profileEntity.phoneNumber;
                  firstNameController.text = profileEntity.firstName;
                  lastNameController.text = profileEntity.lastName;
                  return Column(
                    children: [
                      TextfieldName(
                        hint: kHintFirstName.i18n,
                        controller: firstNameController,
                      ),
                      const VerticalSpacerMedium(),
                      TextfieldName(
                        hint: kHintLastName.i18n,
                        controller: lastNameController,
                      ),
                    ],
                  );
                },
                error: (error) => TextB1(text: error.messageError),
                initial: () => const SizedBox.shrink(),
                loading: _buildSkeleton,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          Spacing.spaceLarge,
          0,
          Spacing.spaceLarge,
          Spacing.spaceExtraLarge,
        ),
        width: double.infinity,
        child: saveProfileState.maybeWhen(
          loading: () => const ButtonV1Loading(),
          orElse: () => ButtonV1(
            text: kSave.i18n,
            fontWeight: FontWeight.bold,
            onPressed: () {
              ref
                  .read(saveProfileProvider.notifier)
                  .saveProfile(
                    firstNameController.text,
                    lastNameController.text,
                  );
              ref.invalidate(getProfileDataProvider);
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSkeleton() => const Column(
    children: [
      SkeletonTextfield(),
      VerticalSpacerMedium(),
      SkeletonTextfield(),
    ],
  );
}
