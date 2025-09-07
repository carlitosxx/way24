import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

/// Checkout phone view
class CartPhoneView extends StatefulWidget {
  /// Checkout phone view
  const CartPhoneView({super.key});

  @override
  State<CartPhoneView> createState() => _CartPhoneViewState();
}

class _CartPhoneViewState extends State<CartPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la compra'),
      ),
      body: Center(
        child: ButtonV1(
          text: 'pagar',
          onPressed: () async {
            try {
              await launchUrl(
                Uri.parse(
                    'https://secure.micuentaweb.pe:443/vads-payment/exec.silent_init_display.a;jsessionid=bFfddab39Cfe9f2E46BdF8AAfac1b8fDC7f1Abcd.vadworldpayment01-tls-prod-fr-lyra?RemoteId=02e4b64ba0264ae7ad15330a0fdbc880&cacheId=529238752503128942050'),
                customTabsOptions: CustomTabsOptions(
                  colorSchemes: CustomTabsColorSchemes.defaults(
                    toolbarColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  shareState: CustomTabsShareState.on,
                  urlBarHidingEnabled: true,
                  showTitle: true,
                  closeButton: CustomTabsCloseButton(
                    icon: CustomTabsCloseButtonIcons.back,
                  ),
                ),
                safariVCOptions: SafariViewControllerOptions(
                  preferredBarTintColor: Theme.of(context).colorScheme.surface,
                  preferredControlTintColor:
                      Theme.of(context).colorScheme.onSurface,
                  barCollapsingEnabled: true,
                  dismissButtonStyle:
                      SafariViewControllerDismissButtonStyle.close,
                ),
              );
            } catch (e) {
              debugPrint(e.toString());
            }
          },
        ),
      ),
    );
  }
}
