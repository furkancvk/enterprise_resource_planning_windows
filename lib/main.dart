import 'package:erp_windows/states/states.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';

import 'design/app_theme_data.dart';
import 'routes/routes.dart';
import 'storage/storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SecureStorage secureStorage = SecureStorage();
  final String? isAuthenticated = await secureStorage.readSecureData('isAuthenticated');
  runApp(
    ChangeNotifierProvider<States>(
      create: (BuildContext context) => States(),
      child: MyApp(isAuthenticated: isAuthenticated),
    ),
  );
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1125, 700);
    win.minSize = initialSize;
    win.size = initialSize;
    win.title = "Solvio ERP";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isAuthenticated}) : super(key: key);

  final String? isAuthenticated;

  @override
  Widget build(BuildContext context) {
    debugPrint("isAuthenticated Main: $isAuthenticated");
    return MaterialApp(
      title: "Solvio Kurumsal Kaynak Planlama Programı",
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme(context),
      initialRoute: isAuthenticated == 'true' ? "home_view" : "login_view",
      routes: routes,
    );
  }
}
