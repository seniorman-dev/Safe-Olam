import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:olam_grains/util/srting_extensions.dart';






/*String availableHoursFunc(int startHour, int endHour) =>
    '$startHour:00${startHour > 11 ? 'PM' : 'AM'} - $endHour:00${startHour > 11 ? 'PM' : 'AM'}';

String doctorNameFunc(String firstname, String lastname) =>
    'Dr. ${firstname.capitalize()} ${lastname.capitalize()}';

String profilePicErrorFunc(String firstname, String lastname) =>
    '${firstname.capitalize()[0]}${lastname.capitalize()[0]}';

String profilePicErrorFunc2(String name) {
  String firstname = name.split(' ')[0];
  String lastname = name.split(' ')[1];
  return '${firstname.capitalize()[0]}${lastname.capitalize()[0]}';
}*/

String returnDateNowString() => DateTime.now().toString();

String formatToDate(String? dateTime) {
  final DateFormat formatter = DateFormat('MMM d, y');
  return formatter.format(DateTime.parse(dateTime ?? returnDateNowString()));
}

String formatToTime(DateTime date) {
  final DateFormat formatter = DateFormat('HH:mm');
  String res =
  formatter.format(date);
  debugPrint(res);
  return res;
}
