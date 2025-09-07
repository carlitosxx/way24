import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/size_screen.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/profile/presentation/models/menu_item.model.dart';
import 'package:way24/features/profile/presentation/profile.i18n.dart';
import 'package:way24/features/profile/presentation/providers/injects_container.provider.dart';

/// Profile phone view
class ProfilePhoneView extends ConsumerStatefulWidget {
  /// Profile phone view
  const ProfilePhoneView({super.key});

  @override
  ConsumerState<ProfilePhoneView> createState() => _ProfilePhoneViewState();
}

class _ProfilePhoneViewState extends ConsumerState<ProfilePhoneView> {
  @override
  Widget build(BuildContext context) {
    final currentSessionState = ref.watch(getProfileDataProvider);
    final listMenuItem = [
      MenuItemModel(
        icon: Icons.manage_accounts,
        text: kModifyData.i18n,
        onTap: () {
          UpdateProfileDataRoute().push<BuildContext>(context);
        },
      ),
      MenuItemModel(
        icon: Icons.shopping_cart_outlined,
        text: 'Mi suscripcion',
        onTap: () {},
      ),
      MenuItemModel(
        icon: Icons.logout,
        text: kLogout.i18n,
        onTap: () {
          ref.read(logoutProvider.notifier).logout();
          SignInRoute().go(context);
        },
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + kToolbarHeight,
                bottom: Spacing.spaceSmall,
              ),
              child: currentSessionState.when(
                data: (profileEntity) => CircleAvatar(
                  radius: SizeScreen.sixthScreenWidth(context),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: TextH1(
                    text:
                        '${profileEntity.firstName[0].toUpperCase()}'
                        '${profileEntity.lastName[0].toUpperCase()}',
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                error: (error) => TextB1(text: error.messageError),
                loading: () => CircleAvatar(
                  radius: SizeScreen.sixthScreenWidth(context),
                  backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                ),
                initial: SizedBox.shrink,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: currentSessionState.when(
              data: (userEntity) => TextH3(
                text: '${userEntity.firstName} ${userEntity.lastName}',
                textAlign: TextAlign.center,
              ),
              error: (error) => TextB1(text: error.messageError),
              loading: () => Center(
                child: Container(
                  height: 16,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ),
              initial: SizedBox.shrink,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spaceLarge,
              vertical: Spacing.spaceMedium,
            ),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: listMenuItem.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(listMenuItem[index].icon),
                  title: Text(listMenuItem[index].text),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: listMenuItem[index].onTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
