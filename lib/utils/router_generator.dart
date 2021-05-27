import 'package:flutter/material.dart';
import 'package:zabbix_flutter_app/features/presentation/page/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => (LoginPage()));
        break;
    }
  }
}
