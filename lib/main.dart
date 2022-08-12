import 'package:erp_windows/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'design/app_theme_data.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1024, 640);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solvio Kurumsal Kaynak Planlama Programlama",
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme(context),
      darkTheme: AppThemeData.darkTheme(context),
      initialRoute: "login_view",
      routes: routes,
    );
  }
}
