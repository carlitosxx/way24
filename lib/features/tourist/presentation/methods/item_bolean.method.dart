import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// create item bolean
Container itemBolean({
  required BuildContext context,
  required String text,
  required IconData icon,
  required bool option,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: option
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.outlineVariant,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon), TextB2(text: text)],
    ),
  );
}
