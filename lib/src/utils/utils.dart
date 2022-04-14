import 'package:flutter/material.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 812;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
  }

  static String getDateFormat(DateTime dateTime) {

    return numberFormat(dateTime.day) +
        "." +
        numberFormat(dateTime.month) +
        "." +
        dateTime.year.toString() +
        " - " +
        numberFormat(dateTime.hour) +
        ":" +
        numberFormat(dateTime.minute);
  }

  static String numberFormat(int n) {
    if (n < 10) {
      return "0" + n.toString();
    } else {
      return n.toString();
    }
  }

  static String monthFormat(int n) {
    if (n == 1) {
      return "Yanvar";
    }
    if (n == 2) {
      return "Fevral";
    }
    if (n == 3) {
      return "Mart";
    }
    if (n == 4) {
      return "Aprel";
    }
    if (n == 5) {
      return "May";
    }
    if (n == 6) {
      return "Iyun";
    }
    if (n == 7) {
      return "Iyul";
    }
    if (n == 8) {
      return "Avgust";
    }
    if (n == 9) {
      return "Sentabr";
    }
    if (n == 10) {
      return "Oktabr";
    }
    if (n == 12) {
      return "Noyabr";
    } else {
      return "Dekabr";
    }
  }
}
