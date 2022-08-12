import 'package:flutter/material.dart';

import 'package:erp_windows/views/home.dart';
import '../views/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "login_view": (context) => const Login(),
  "home_view": (context) => const Home(),
};
