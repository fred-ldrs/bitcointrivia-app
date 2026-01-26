import 'package:flutter/material.dart';

enum ThemePreference { light, dark, system }

class ThemeProvider extends ChangeNotifier {
  ThemePreference _themePreference = ThemePreference.system;
  
  ThemePreference get themePreference => _themePreference;

  ThemeMode get themeMode {
    switch (_themePreference) {
      case ThemePreference.light:
        return ThemeMode.light;
      case ThemePreference.dark:
        return ThemeMode.dark;
      case ThemePreference.system:
        return ThemeMode.system;
    }
  }

  void setThemePreference(ThemePreference preference) {
    _themePreference = preference;
    notifyListeners();
  }
}
