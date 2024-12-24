import 'package:flutter/material.dart';

class AppColors {
  static Color color(BuildContext context, int shade) {
    Color primaryColor = Theme.of(context).primaryColor;

    if (primaryColor.toString() == 'Color(0xff0061a4)') {
      return Colors.blue[shade]!;
    } else if (primaryColor.toString() == 'Color(0xffbb1614)') {
      return Colors.red[shade]!;
    } else if (primaryColor.toString() == 'Color(0xff006a60)') {
      return Colors.teal[shade]!;
    }

    return primaryColor;
  }
}
