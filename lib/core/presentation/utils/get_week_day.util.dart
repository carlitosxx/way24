import 'package:flutter/material.dart';
import 'package:way24/core/presentation/global.i18n.dart';

/// get week day
String getWeekday(int dayNumber, BuildContext context) {
  final weekdays = {
    1: kMonday.i18n,
    2: kTuesday.i18n,
    3: kWednesday.i18n,
    4: kThursday.i18n,
    5: kFriday.i18n,
    6: kSaturday.i18n,
    7: kSunday.i18n,
  };

  return weekdays[dayNumber] ?? kInvalidDay.i18n;
}
