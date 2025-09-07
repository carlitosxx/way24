import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/size_screen.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/core/presentation/utils/get_week_day.util.dart';
import 'package:way24/core/presentation/utils/int_to_hours_and_minutes.util.dart';
import 'package:way24/features/tourist/presentation/methods/item_bolean.method.dart';
import 'package:way24/features/tourist/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/tourist/presentation/widgets/draggable_sheet.widget.dart';
import 'package:way24/features/tourist/presentation/widgets/draggable_sheet_gas_station.widget.dart';
import 'package:way24/features/tourist/presentation/widgets/draggable_sheet_tire_repair.widget.dart';
import 'package:way24/features/tourist/tourist.i18n.dart';
import 'package:url_launcher/url_launcher.dart';

/// site tourist phone view
class SiteTouristPhoneView extends ConsumerStatefulWidget {
  /// site tourist phone view
  const SiteTouristPhoneView({required this.touristSite, super.key});

  /// tourist site
  final String touristSite;
  @override
  ConsumerState<SiteTouristPhoneView> createState() =>
      _SiteTouristPhoneViewState();
}

class _SiteTouristPhoneViewState extends ConsumerState<SiteTouristPhoneView> {
  late Map<String, dynamic> entidadTuristica;
  // late TouristSiteEntity touristSite;
  final MapController _mapController = MapController();
  final bool _isInteracting = false;
  bool hasCallSupport = false;
  Future<void>? launched;

  @override
  void initState() {
    super.initState();
    // entidadTuristica = jsonDecode(widget.touristSite) as Map<String, dynamic>;
    // touristSite = TouristSiteModel.fromMap(entidadTuristica);
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getTouristSitesState = ref.watch(getTouristSitesNotifierProvider);
    return getTouristSitesState.maybeWhen(
      orElse: () =>
          TextB1(text: kDataNotAvailable.i18n, textAlign: TextAlign.center),
      error: (error) => TextB1(
        text: 'Error: ${error.messageError}',
        textAlign: TextAlign.center,
      ),
      data: (listTouristSite) {
        final touristSite = listTouristSite[int.parse(widget.touristSite)];
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // AppBar
              SliverAppBar(
                floating: true,
                expandedHeight: 160,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(touristSite.title),
                  background: Image.network(
                    touristSite.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title description
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: TextH3(text: kDescription.i18n),
                ),
              ),
              // Description
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spaceLarge,
                ),
                sliver: SliverList.builder(
                  itemCount: touristSite.description.length,
                  itemBuilder: (context, index) {
                    if (touristSite.description[index].type == 'paragraph') {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextB1(
                          text:
                              touristSite.description[index].description ??
                              kNoDescription.i18n,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    }
                    if (touristSite.description[index].type == 'image') {
                      return touristSite.description[index].urlImage == null
                          ? null
                          : AspectRatio(
                              aspectRatio: 3 / 4,
                              child: Container(
                                height: 200,
                                // width: 60,
                                margin: const EdgeInsets.only(
                                  top: Spacing.spaceSmall,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      touristSite.description[index].urlImage!,
                                    ),
                                  ),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                    }
                    return null;
                  },
                ),
              ),
              // Title Responsible Phone
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: TextH3(text: kResponsiblePhone.i18n),
                ),
              ),
              // phones
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spaceLarge,
                ),
                sliver: SliverList.builder(
                  itemCount: touristSite.responsiblesPhone.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: hasCallSupport
                        ? () => setState(() {
                            launched = _makePhoneCall(
                              touristSite.responsiblesPhone[index],
                            );
                          })
                        : null,
                    leading: const Icon(Icons.phone),
                    title: TextB1(text: touristSite.responsiblesPhone[index]),
                  ),
                ),
              ),
              // Opening hours
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextH3(text: kOpeningHours.i18n),
                      ...touristSite.openingHours.map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextB1(
                              text: getWeekday(e.day, context),
                              fontWeight: FontWeight.bold,
                            ),
                            TextB2(text: '${e.openingTime} - ${e.closingTime}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Maintenance schedule
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextH3(text: kMaintenanceSchedule.i18n),
                      TextB1(text: touristSite.maintenanceSchedule),
                    ],
                  ),
                ),
              ),
              // Title extra informations
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: TextH3(text: kExtraInformation.i18n),
                ),
              ),
              // Boleans items
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spaceSmall,
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: Spacing.spaceSmall,
                    runSpacing: 12,
                    children: [
                      itemBolean(
                        context: context,
                        icon: Icons.beach_access,
                        option: touristSite.requiresHatOrUmbrella,
                        text: kUmbrella.i18n,
                      ),
                      itemBolean(
                        context: context,
                        icon: Icons.accessibility,
                        option: touristSite.accessibility,
                        text: kAccesibility.i18n,
                      ),
                      itemBolean(
                        context: context,
                        icon: Icons.pets,
                        option: touristSite.isPetFriendly,
                        text: kPetFriendly.i18n,
                      ),
                      itemBolean(
                        context: context,
                        icon: Icons.local_parking,
                        option: touristSite.hasParking,
                        text: kHasParking.i18n,
                      ),
                      itemBolean(
                        context: context,
                        icon: Icons.bug_report,
                        option: touristSite.requiresRepellent,
                        text: kRepellent.i18n,
                      ),
                      itemBolean(
                        context: context,
                        icon: Icons.sunny,
                        option: touristSite.requiresSunscreen,
                        text: kSunScreen.i18n,
                      ),
                    ],
                  ),
                ),
              ),

              // Location Sub title
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextH3(text: kLocation.i18n),
                          const HorizontalSpacerSmall(),
                          TextB1(
                            text: intToHoursAndMinutes(
                              touristSite.durationTransport,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => CustomDraggableSheet(
                                  listCarriers: touristSite.carriers,
                                ),
                              );
                            },
                            child: Icon(
                              Icons.airport_shuttle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const HorizontalSpacerSmall(),
                          TextB1(text: touristSite.address),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Maps location
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    if (!_isInteracting) {
                      MapRoute(
                        latitude: touristSite.latitude,
                        longitude: touristSite.longitude,
                      ).push<BuildContext>(context);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Spacing.spaceLarge,
                      vertical: Spacing.spaceSmall,
                    ),
                    height: SizeScreen.quarterScreenWidth(context),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: IgnorePointer(
                        ignoring: !_isInteracting,
                        child: FlutterMap(
                          mapController: _mapController,
                          options: MapOptions(
                            initialCenter: LatLng(
                              touristSite.latitude,
                              touristSite.longitude,
                            ),
                            initialZoom: 18,
                            maxZoom: 20,
                            minZoom: 14,
                            initialRotation: 56.5,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 100,
                                  height: 100,
                                  point: LatLng(
                                    touristSite.latitude,
                                    touristSite.longitude,
                                  ),
                                  child: const Icon(
                                    Icons.location_pin,
                                    color: Colors.redAccent,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Stations gas and Tire Repair
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spaceLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextH3(text: kTravelWithYourVehicle.i18n),
                      const VerticalSpacerSmall(),
                      ListTile(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                CustomDraggableSheetGasStation(
                                  listGasStation: touristSite.gasStations,
                                ),
                          );
                        },
                        title: TextH4(text: kGasStations.i18n),
                        subtitle: TextB1(text: kFindGasStations.i18n),
                        leading: Icon(
                          Icons.local_gas_station,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                CustomDraggableSheetTireRepair(
                                  listTireRepair: touristSite.tireRepairShop,
                                ),
                          );
                        },
                        title: TextH4(text: kTireRepairShop.i18n),
                        subtitle: TextB1(text: kFindTireRepairShop.i18n),
                        leading: Icon(
                          Icons.tire_repair,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
