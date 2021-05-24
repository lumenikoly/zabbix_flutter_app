import 'package:flutter/material.dart';
import 'package:zabbix_flutter_app/service/sharedpref_service.dart';

class ThemeService {
  static const Map<String, ThemeMode> themes = {
    "Dark": ThemeMode.dark,
    "Light": ThemeMode.light,
    "System": ThemeMode.system
  };

  static const String THEME_PREF = "themeMode";

  ThemeMode getTheme() {
    Future<String> theme = SharedPrefsService.readData(THEME_PREF);
    if (theme == null) {
      return ThemeMode.system;
    } else {
      return themes[theme];
    }
  }
}
