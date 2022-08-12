import 'package:flutter/material.dart';

import '../views/contents/barcode.dart';
import 'package:erp_windows/views/contents/departments.dart';
import 'package:erp_windows/views/contents/documents.dart';
import 'package:erp_windows/views/contents/order.dart';
import 'package:erp_windows/views/contents/panel.dart';
import 'package:erp_windows/views/contents/staff.dart';
import 'package:erp_windows/views/contents/stock.dart';
import '../views/login.dart';


Map<String, Widget Function(BuildContext)> routes = {
  "login_view": (context) => const Login(),
  "barcode_view": (context) => const Barcode(),
  "departments_view": (context) => const Departments(),
  "documents_view": (context) => const Documents(),
  "order_view": (context) => const Order(),
  "panel_view": (context) => const Panel(),
  "staff_view": (context) => const Staff(),
  "stock_view": (context) => const Stock(),
};