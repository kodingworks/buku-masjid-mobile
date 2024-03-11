import 'package:intl/intl.dart';

/// Extension for formatting DateTime objects as Indonesian transaction date format.
extension IndonesianDateFormatter on DateTime {
  /// Formats the DateTime object as Indonesian transaction date format.
  ///
  /// Returns the formatted string representing the DateTime object in the format "dd-MMMM-y hh:mm".
  String get toTransaction {
    return DateFormat('dd-MMMM-y hh:mm', 'id_ID').format(this);
  }
}
