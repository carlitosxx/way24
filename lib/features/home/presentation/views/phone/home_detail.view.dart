import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/home/presentation/home.i18n.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/home/presentation/widgets/list_horizontal_circle.widget.dart';
import 'package:way24/features/home/presentation/widgets/skeleton_list_horizontal.widget.dart';
// import 'package:way24/features/home/presentation/widgets/skeleton_list_vertical_cards.widget.dart';
// import 'package:way24/features/home/presentation/widgets/sliver_list_crews.widget.dart';

///Home detail phone view
class HomeDetailPhoneView extends ConsumerWidget {
  ///Home detail phone view
  const HomeDetailPhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateCategories = ref.watch(getCategoriesNotifierProvider);
    // final stateCrews = ref.watch(getCrewsNotifierProvider);

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              // Categories section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextH4(
                        text: kCategories.i18n,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TextB1(
                          text: kSeeAll.i18n,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              stateCategories.maybeWhen(
                orElse: () => const SliverToBoxAdapter(
                  child: Text('Sin errores y sin datos'),
                ),
                error: (value) =>
                    SliverToBoxAdapter(child: Text(value.messageError)),
                loading: () => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: Spacing.spaceMedium),
                    child: SkeletonListHorizontalCircle(),
                  ),
                ),
                data: (listCategories) => SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Spacing.spaceMedium),
                    child: ListHorizontalCircle(listCategories: listCategories),
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: Spacing.spaceLarge,
              //     ),
              //     child: TextH4(
              //       text: kListCrew.i18n,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // const SliverToBoxAdapter(
              //   child: VerticalSpacerSmall(),
              // ),

              /// List crews
              // stateCrews.maybeWhen(
              //   orElse: () => const SliverToBoxAdapter(
              //     child: Text('Sin errores y sin datos'),
              //   ),
              //   error: (error) => SliverToBoxAdapter(
              //     child: Text(
              //       error.messageError,
              //     ),
              //   ),
              //   loading: () => const SkeletonListVerticalCards(),
              //   data: (listCrews) => SliverListCrews(
              //     listCrews: listCrews,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
