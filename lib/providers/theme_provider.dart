import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';

class ThemeNotifier extends StateNotifier<MaterialColor> {
  ThemeNotifier(String privilege) : super(privilege == AppConstants.roleAdmin || privilege == AppConstants.roleCentreUser ? Colors.teal : Colors.red);

  // MaterialColor get primarySwatch => state;

  // void toggleDoctor() {
  //   state = Colors.teal;
  // }

  // void toggleUser() {
  //   state = Colors.red;
  // }

  // void toggleMinister() {
  //   state = Colors.blue;
  // }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, MaterialColor>(
  (ref) {
    final prefs = ref.watch(prefsProvider);
    return ThemeNotifier(prefs[AppConstants.privileges] ?? AppConstants.roleUser);
  },
);
