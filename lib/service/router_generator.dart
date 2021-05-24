import 'package:flutter/material.dart';
import 'package:zabbix_flutter_app/ui/screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => (LoginScreen()));
        break;
    }
  }
}
