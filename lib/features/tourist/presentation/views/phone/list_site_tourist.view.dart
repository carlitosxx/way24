import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/theme/size_screen.dart';

import 'package:way24/features/tourist/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/tourist/presentation/widgets/cards_diagonal.widget.dart';
import 'package:way24/features/tourist/tourist.i18n.dart';

/// List site tourist phone view
class ListSiteTouristPhoneView extends ConsumerStatefulWidget {
  /// List site tourist phone view
  const ListSiteTouristPhoneView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListSiteTouristPhoneViewState();
}

class _ListSiteTouristPhoneViewState
    extends ConsumerState<ListSiteTouristPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(kTouristList.i18n),
      ),
      body: ListView(children: [_buildTouristSitesContent(context)]),
    );
  }

  Widget _buildTouristSitesContent(BuildContext context) {
    final getTouristSitesState = ref.watch(getTouristSitesNotifierProvider);
    return getTouristSitesState.maybeWhen(
      orElse: () => _buildCenteredText(kDataNotAvailable.i18n),
      error: (error) => _buildCenteredText('Error: $error'),
      data: (listTouristSite) => CardsDiagonal(
        listTouristSite: listTouristSite,
        height: SizeScreen.seventyPercentHeight(context),
      ),
      loading: () => SkeletonCardsDiagonal(
        height: SizeScreen.seventyPercentHeight(context),
      ),
    );
  }

  Widget _buildCenteredText(String message) {
    return Center(child: TextB1(text: message));
  }
}
