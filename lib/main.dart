import 'package:erp_windows/states/states.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';

import 'design/app_theme_data.dart';
import 'routes/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider<States>(
      create: (BuildContext context) => States(),
      child: const MyApp(),
    ),
  );
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1085, 650);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solvio Kurumsal Kaynak Planlama Programlama",
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme(context),
      darkTheme: AppThemeData.darkTheme(context),
      initialRoute: "home_view",
      routes: routes,
    );
  }
}
