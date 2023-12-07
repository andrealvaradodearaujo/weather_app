import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatHourMin() {
    return DateFormat('HH:mm').format(this);
  }

  String formatDateTime() {
    return DateFormat('yyyy/MM/dd HH:mm\'h\'').format(this);
  }

  String formatWeekDayAndDateTime() {
    return DateFormat('EEEE, yyyy/MM/dd').format(this);
  }
}
