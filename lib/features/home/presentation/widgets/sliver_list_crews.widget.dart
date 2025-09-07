import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:way24/core/presentation/router/routes.dart';
// import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/core/presentation/utils/capitalize_first_letter.util.dart';
import 'package:way24/core/presentation/utils/range_date.util.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';

/// Sliver list crews
class SliverListCrews extends ConsumerWidget {
  /// Sliver list crews
  const SliverListCrews({required this.listCrews, super.key});

  /// property required list of CrewsEntity
  final List<CrewEntity> listCrews;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList.builder(
      itemCount: listCrews.length,
      itemBuilder: (context, index) {
        final currentLocale = Localizations.localeOf(context);
        final dateStart = capitalizeFirstLetter(
          DateFormat(
            'MMM dd',
            currentLocale.languageCode,
          ).format(listCrews[index].dateStart),
        );
        final dateEnd = capitalizeFirstLetter(
          DateFormat(
            'MMM dd',
            currentLocale.languageCode,
          ).format(listCrews[index].dateEnd),
        );
        return GestureDetector(
          onTap: () {
            ref
                .read(getDetailCrewByIdNotifierProvider.notifier)
                .getDetailCrewById(listCrews[index].id);
            DetailCrewRoute(
              id: listCrews[index].id,
            ).push<BuildContext>(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Spacing.spaceLarge,
              vertical: Spacing.spaceSmall,
            ),
            // height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    Spacing.spaceSmall,
                    Spacing.spaceSmall,
                    Spacing.spaceSmall,
                    0,
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Banner(
                      message: checkDateRangeStatus(
                        listCrews[index].dateStart,
                        listCrews[index].dateEnd,
                      ),
                      location: BannerLocation.topStart,
                      color: getDateRangeStatusColor(
                        listCrews[index].dateStart,
                        listCrews[index].dateEnd,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: FadeInImage.assetNetwork(
                        height: 200,
                        placeholder: 'assets/imgs/400x200.jpg',
                        image: listCrews[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const VerticalSpacerSmall(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceSmall,
                  ),
                  alignment: Alignment.centerLeft,
                  child: TextH4(
                    text: listCrews[index].name,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const VerticalSpacerSmall(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceSmall,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      TextB1(text: '$dateStart - $dateEnd'),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      TextB1(text: listCrews[index].district),
                    ],
                  ),
                ),
                const VerticalSpacerSmall(),
              ],
            ),
          ),
        );
      },
    );
  }
}
