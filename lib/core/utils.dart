import 'package:shamsi_date/shamsi_date.dart';

extension GregorianToShamsi on String {
  String get toShamsi {
    try {
      DateTime parsedDate = DateTime.parse(this);
      Jalali shamsiDate = Jalali.fromDateTime(parsedDate);
      return '${shamsiDate.year}/${shamsiDate.month}/${shamsiDate.day}';
    } catch (e) {
      return "Invalid Date";
    }
  }
}

//
List<String> sortedWeekDays(List<int> weekDays) {
  Map<int, String> weekDayNames = {
    5: 'شنبه',
    6: 'یکشنبه',
    0: 'دوشنبه',
    1: 'سه‌شنبه',
    2: 'چهارشنبه',
    3: 'پنج‌شنبه',
    4: 'جمعه',
  };

  // Sort the weekDays list manually considering the week starts from Saturday (5)
  weekDays.sort((a, b) {
    int adjustedA = a >= 5 ? a - 7 : a;
    int adjustedB = b >= 5 ? b - 7 : b;
    return adjustedA.compareTo(adjustedB);
  });

  // Convert the sorted integers to week day names
  return weekDays.map((day) => weekDayNames[day] ?? '').toList();
}
//