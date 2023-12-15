import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatHourMin() {
    return DateFormat('HH:mm').format(this);
  }

  String formatDay() {
    return DateFormat('yyyy/MM/dd').format(this);
  }

  String formatDateTime() {
    return DateFormat('yyyy/MM/dd HH:mm\'h\'').format(this);
  }

  String formatWeekDayAndDateTime() {
    return DateFormat('EEEE, yyyy/MM/dd').format(this);
  }
}

extension IntExtension on int {
  /// Converts Unix timestamp to [DateTime].
  DateTime getDateTimeFromUnixTimestamp() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}