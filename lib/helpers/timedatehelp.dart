import 'package:flutter/material.dart';

class Timedateset {
  static timeset({required BuildContext context, required String time}) {
    // Check if time is not null and is a valid number
    if (time.isNotEmpty) {
      try {
        final datetime = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
        return TimeOfDay.fromDateTime(datetime).format(context);
      } catch (e) {
        print("error: ${e.toString()}");
        return "Invalid time format"; // Return a fallback message
      }
    } else {
      return "No time provided"; // Return a message if the time is empty or null
    }
  }

  static String getlasttime(
      {required BuildContext context, required String time}) {
    if (time.isNotEmpty) {
      try {
        final sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
        final timenow = DateTime.now();
        if (timenow.day == sent.day &&
            timenow.month == sent.month &&
            timenow.year == sent.year) {
          return TimeOfDay.fromDateTime(sent).format(context);
        }
        return "${sent.day} ${getmonth(sent)}";
      } catch (e) {
        print("error: ${e.toString()}");
        return "Invalid time format"; // Return a fallback message
      }
    } else {
      return "No time provided"; // Return a message if the time is empty or null
    }
  }

  static getmonth(DateTime time) {
    switch (time.month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Unknown";
    }
  }
}
