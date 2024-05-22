import 'package:intl/intl.dart';

String formattedDate(DateTime? dateTime) {
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  if (dateTime == null) {
    return "Sem Data";
  } else {
    String dateFormatted = formatter.format(dateTime);

    return dateFormatted;
  }
}
