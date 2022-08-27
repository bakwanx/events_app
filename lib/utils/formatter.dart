import 'package:intl/intl.dart';

class FormatterDate{

  static String formatDate(String date){
    DateTime y = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(y);
    return formatted;
  }

  static String formatTime(String date){
    DateTime y = DateTime.parse(date);
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(y);
    return formatted;
  }

}