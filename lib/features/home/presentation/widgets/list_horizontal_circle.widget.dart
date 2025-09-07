import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/core/presentation/utils/capitalize_first_letter.util.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';

/// Widget list horizontal circle
class ListHorizontalCircle extends StatelessWidget {
  /// Widget list horizontal circle
  const ListHorizontalCircle({required this.listCategories, super.key});

  /// Property list categories
  final List<CategoryEntity> listCategories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategories.length,
        itemBuilder: (context, index) {
          final currentLocale = Localizations.localeOf(context);
          late final String title;
          if (currentLocale.languageCode == 'es') {
            title = listCategories[index].titleEs;
          } else {
            title = listCategories[index].titleEn;
          }
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: (index == 0)
                        ? Spacing.spaceLarge
                        : Spacing.spaceMedium,
                  ),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: (index == 0)
                        ? Spacing.spaceLarge
                        : Spacing.spaceMedium,
                  ),
                  child: TextB1(text: capitalizeFirstLetter(title)),
                ),
                const VerticalSpacerSmall(),
              ],
            ),
          );
        },
      ),
    );
  }
}
