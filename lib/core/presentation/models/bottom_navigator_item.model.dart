import 'package:flutter/material.dart';

/// Model for bottom navigator item
class BottomNavigatorItemModel {
  /// Model for bottom navigator item
  BottomNavigatorItemModel({
    required this.icon,
    required this.label,
    required this.index,
  });

  /// property icondata
  final IconData icon;

  /// property label
  final String label;

  /// property index
  final int index;
}
