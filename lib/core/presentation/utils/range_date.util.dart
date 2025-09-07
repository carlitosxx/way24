import 'package:flutter/material.dart';
import 'package:way24/core/presentation/global.i18n.dart';

///
/// This function determines whether today's date:
/// - Falls within the given `startDate` and `endDate` (inclusive).
/// - Is before the range (upcoming).
/// - Is after the range (passed).
///
/// - Parameters:
///   - startDate: The starting date of the range.
///   - endDate: The ending date of the range.
/// - Returns: A string indicating the status: "today", "upcoming", or "passed"
String checkDateRangeStatus(DateTime startDate, DateTime endDate) {
  final today = DateTime.now().toUtc().subtract(const Duration(hours: 5));
  startDate.toUtc();
  endDate.toUtc();
  if (today.isAfter(startDate) && today.isBefore(endDate)) {
    return kToday.i18n; // The current date is within the range.
  } else if (today.isBefore(startDate)) {
    return kUpcomming.i18n; // The range is in the future.
  } else {
    return kPassed.i18n; // The range is in the past.
  }
}

/// Checks the status of the current date relative to a specified date range and
/// returns a color for visualization.
///
/// This function determines whether today's date:
/// - Falls within the given `startDate` and `endDate` (inclusive).
/// - Is before the range (upcoming).
/// - Is after the range (passed).
///
/// - Parameters:
///   - startDate: The starting date of the range.
///   - endDate: The ending date of the range.
/// - Returns: A `Color` indicating the status: green (within), blue (upcoming),
///  or red (passed).

Color getDateRangeStatusColor(DateTime startDate, DateTime endDate) {
  final today = DateTime.now().toUtc().subtract(const Duration(hours: 5));
  startDate.toUtc();
  endDate.toUtc();
  if (today.isAfter(startDate) && today.isBefore(endDate)) {
    return Colors.green;
  } else if (today.isBefore(startDate)) {
    return Colors.blue;
  } else {
    return Colors.red;
  }
}
