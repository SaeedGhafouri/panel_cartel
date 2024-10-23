import 'package:shamsi_date/shamsi_date.dart';

class DateConverter {
  String convertToShamsi(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    Jalali shamsiDate = Jalali.fromDateTime(parsedDate);
    String shamsiDateStr = "${shamsiDate.year}/${shamsiDate.month}/${shamsiDate.day}";
    return shamsiDateStr;
  }
}
