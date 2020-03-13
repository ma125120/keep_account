import 'package:intl/intl.dart';

Map Weekdays = {
  1: '星期一',
  2: '星期二',
  3: '星期三',
  4: '星期四',
  5: '星期五',
  6: '星期六',
  7: '星期七',
};

class MyDate {
  static DateTime getNow() {
    return new DateTime.now();
  }
  static DateTime parse([String formattedString]) {
    return DateTime.tryParse(formattedString);
  }

  static String format([String newPattern, dynamic date]) {
    return new DateFormat(newPattern).format(date);
  }

  static String weekday(DateTime date) {
    return Weekdays[date.weekday];
  }
}

