import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zabbix_flutter_app/service/theme_service.dart';

enum Themes { DARK, LIGHT, SYSTEM }

const Map<Themes, ThemeMode> themes = {
  Themes.DARK: ThemeMode.dark,
  Themes.LIGHT: ThemeMode.light,
  Themes.SYSTEM: ThemeMode.system
};

final themeProvider = StateNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  Themes currentTheme = Themes.SYSTEM;

  ThemeService _themeService = new ThemeService();

  void changeTheme(Themes theme) {
    state = themes[theme];
    currentTheme = theme;
  }

  ThemeMode getTheme() {
    return themes[''];
  }
}
