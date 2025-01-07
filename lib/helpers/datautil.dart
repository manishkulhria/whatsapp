import 'package:flutter/material.dart';
import 'package:whatsapp/helpers/timedatehelp.dart';

class Dateutil {
  static String setstatus(
      {required BuildContext context, required String lastactive}) {
    int i = int.tryParse(lastactive) ?? -1;

    if (i == -1) return "Last seen not available";
    DateTime nowtime = DateTime.now();
    DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    String formattime = TimeOfDay.fromDateTime(time).format(context);
    if (time.day == nowtime.day &&
        time.month == nowtime.month &&
        time.year == nowtime.year) {
      return "Last seen today at $formattime";
    } 
    if ((nowtime.difference(time).inHours / 24).round() == 1) {
      return "Last seen yesterday at $formattime";
    }
    String month = Timedateset.getmonth(time);
    return "Last seen on ${time.day} $month on $formattime";
  }
}
