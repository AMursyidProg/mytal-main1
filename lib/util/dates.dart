import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/util/dimensions.dart';

class Dates {
  static calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static Widget getChartDates(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.fontSizeExtraSmall,
    );
    String monthFormatted = DateFormat('d MMM').format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
    String yearFormatted = DateFormat('yy').format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
    if (value == meta.max || value == meta.min) {
      return const SizedBox();
    }
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 1,
        child: Column(
          children: [
            Text(monthFormatted, style: style),
            Text(
              "'$yearFormatted",
              style: style,
            ),
          ],
        ));
  }
}
