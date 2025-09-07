import 'package:flutter/widgets.dart';

/// Menu Item model
class MenuItemModel {
  /// Menu Item model
  MenuItemModel({
    required this.icon,
    required this.text,
    // required this.route,
    this.onTap,
  });

  /// Property icon
  final IconData icon;

  /// Property text
  final String text;

  /// Property onTap
  void Function()? onTap;

  /// Property route
  // final T route;
}
