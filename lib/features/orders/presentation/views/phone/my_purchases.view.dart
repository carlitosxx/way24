import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/features/orders/presentation/orders.i18n.dart';

/// class my purchases phone view
class MyPurchasesPhoneView extends StatelessWidget {
  /// class my purchases phone view
  const MyPurchasesPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextH3(text: kMyPurchases.i18n)),
      body: SafeArea(child: const Center(child: Text('My Purchases'))),
    );
  }
}
