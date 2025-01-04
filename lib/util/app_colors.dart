import 'package:flutter/material.dart';

class AppColors {
  static Color color(BuildContext context, int shade) {
    Color primaryColor = Theme.of(context).primaryColor;
    String hex = primaryColor.value.toRadixString(16).padLeft(8, '0');

    if (hex == 'ff0061a4') {
      return Colors.blue[shade]!;
    } else if (hex == 'ffbb1614') {
      return Colors.red[shade]!;
    } else if (hex == 'ff006a60') {
      return Colors.teal[shade]!; 
    }

    return primaryColor;
  }
}
