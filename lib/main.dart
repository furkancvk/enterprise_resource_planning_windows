import 'package:erp_windows/states/states.dart';
import 'package:erp_windows/views/login.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';

import 'design/app_theme_data.dart';
import 'routes/routes.dart';
import 'storage/storage.dart';

void main() {
  runApp(
    ChangeNotifierProvider<States>(
      create: (BuildContext context) => States(),
      child: const MyApp(),
    ),
  );
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1125, 700);
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
  final SecureStorage secureStorage = SecureStorage();

  Future<String> getToken() async {
    return await secureStorage.readSecureData('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getToken(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: "Solvio Kurumsal Kaynak Planlama Programlama",
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.lightTheme(context),
          // darkTheme: AppThemeData.darkTheme(context),
          // home: const Login(),
          initialRoute: snapshot.data == null ? "home_view" : "login_view",
          routes: routes,
        );
      },
    );
  }
}
