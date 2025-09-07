import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:way24/features/auth/presentation/auth.i18n.dart';
import 'package:way24/features/auth/presentation/providers/validations.provider.dart';

/// Date of birth picker
class DateBirthPicker extends StatefulWidget {
  /// Date of birth picker
  const DateBirthPicker({required this.ref, super.key});

  /// Widget ref
  final WidgetRef ref;

  @override
  State<DateBirthPicker> createState() => _DateBirthPickerState();
}

class _DateBirthPickerState extends State<DateBirthPicker> {
  DateTime? _selectedDateValue;
  @override
  Widget build(BuildContext context) {
    final stateDateBirth = widget.ref.watch(dateOfBirthProvider);
    return TextfieldModalPopup(
      hint: kHintDateBirthPicker.i18n,
      text: stateDateBirth != null
          ? DateFormat('dd-MMM-yyyy').format(stateDateBirth)
          : null,
      onTap: () {
        showCupertinoModalPopup<Widget>(
          context: context,
          builder: (BuildContext context) {
            return PopScope(
              onPopInvokedWithResult: (didPop, result) {
                widget.ref
                    .read(dateOfBirthProvider.notifier)
                    .update((_) => _selectedDateValue);
              },
              child: Container(
                height: 250,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        dateOrder: DatePickerDateOrder.dmy,
                        onDateTimeChanged: (DateTime dateTime) {
                          _selectedDateValue = dateTime;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icons.calendar_month_rounded,
    );
  }
}
