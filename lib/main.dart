import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zabbix_flutter_app/service/router_generator.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(ProviderScope(child: ZabbixApp()));
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 500);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Flutterix";
    win.show();
  });
}

class ZabbixApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Flutterix',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
