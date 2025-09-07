import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/core/presentation/utils/capitalize_first_letter.util.dart';
import 'package:way24/features/home/presentation/home.i18n.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

/// Detail crew phone view
class DetailCrewPhoneView extends ConsumerStatefulWidget {
  /// Detail crew phone view
  const DetailCrewPhoneView({required this.id, super.key});

  /// parameter id crew
  final String id;

  @override
  ConsumerState<DetailCrewPhoneView> createState() =>
      _DetailCrewPhoneViewState();
}

class _DetailCrewPhoneViewState extends ConsumerState<DetailCrewPhoneView> {
  @override
  Widget build(BuildContext context) {
    final detailCrewByIdState = ref.watch(getDetailCrewByIdNotifierProvider);
    return Scaffold(
      body: detailCrewByIdState.maybeWhen(
        orElse: () => const Center(child: Text('orElse')),
        error: (error) => Center(child: Text(error.messageError)),
        data: (crewDetailEntity) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 270,
                child: Stack(
                  children: [
                    /// Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        crewDetailEntity.imageUrl,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// Buttom  back
                    Positioned(
                      top: kToolbarHeight,
                      left: Spacing.spaceMedium,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.arrow_back_ios_outlined),
                        ),
                      ),
                    ),

                    /// Google Maps
                    Positioned(
                      top: 180,
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(
                                getUserLocationStreamNotifierProvider.notifier,
                              )
                              .getUserLocationStream(
                                crewDetailEntity.responsible,
                              );
                          CrewTrackingRoute().push<BuildContext>(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surface,
                          radius: 50,
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/imgs/map.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Name,date founded and place
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextH4(
                      text: crewDetailEntity.name,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                    TextB1(
                      text: kFoundedInTheYearIn.i18n.fill([
                        crewDetailEntity.dateFoundation.year,
                        crewDetailEntity.district,
                      ]),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextH4(text: kEvents.i18n),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverList.builder(
                itemCount: crewDetailEntity.events.length,
                itemBuilder: (context, index) {
                  final e = crewDetailEntity.events[index];
                  final currentLocale = Localizations.localeOf(context);
                  final date = capitalizeFirstLetter(
                    DateFormat(
                      'MMM dd',
                      currentLocale.languageCode,
                    ).format(e.date),
                  );

                  return TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.17,
                    isFirst: e.order == 1,
                    beforeLineStyle: LineStyle(
                      thickness: 2,
                      color: DateTime.now().isAfter(e.date)
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.outline,
                    ),
                    indicatorStyle: IndicatorStyle(
                      iconStyle: IconStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        iconData: DateTime.now().isAfter(e.date)
                            ? Icons.check_outlined
                            : Icons.timer_outlined,
                      ),
                      color: DateTime.now().isAfter(e.date)
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.outline,
                    ),
                    endChild: Container(
                      padding: const EdgeInsets.only(
                        left: Spacing.spaceSmall,
                        top: Spacing.spaceSmall,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextB1(
                              text: e.title,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextB2(text: e.address),
                          ),
                        ],
                      ),
                    ),
                    startChild: Container(
                      padding: const EdgeInsetsDirectional.only(
                        top: Spacing.spaceSmall,
                      ),
                      child: Column(
                        children: [
                          TextB2(text: date),
                          TextB2(text: '${e.date.hour}:${e.date.minute}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextH4(text: kFounders.i18n),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverList.builder(
                itemCount: crewDetailEntity.founders.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: TextB1(text: crewDetailEntity.founders[index]),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextH4(text: kDancers.i18n),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spaceMedium,
              ),
              sliver: SliverList.builder(
                itemCount: crewDetailEntity.characters.length,
                itemBuilder: (context, index) {
                  final character = crewDetailEntity.characters[index];
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: TextB1(
                      text: '${character.name} (${character.character})',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
