import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/widgets/app_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';

import '../states/states.dart';
import '../views/contents/barcode.dart';
import 'package:erp_windows/views/contents/panel.dart';
import 'package:erp_windows/views/contents/stock_material.dart';
import 'package:erp_windows/views/contents/order_incoming.dart';
import 'package:erp_windows/views/contents/order_outgoing.dart';
import 'package:erp_windows/views/contents/order_prepared.dart';
import 'package:erp_windows/views/contents/staff.dart';
import 'package:erp_windows/views/contents/stock_product.dart';
import 'package:erp_windows/views/contents/department_human_resources.dart';
import 'package:erp_windows/views/contents/department_production.dart';
import 'package:erp_windows/views/contents/department_store.dart';
import 'package:erp_windows/views/contents/department_transfer.dart';
import 'package:erp_windows/views/contents/doc_bills.dart';
import 'package:erp_windows/views/contents/doc_reports.dart';

const borderColor = AppColors.lightSecondary;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> contents = const [
  Panel(), // 0
  MaterialStock(), // 1
  ProductStock(), // 2
  IncomingOrder(), // 3
  PreparedOrder(), // 4
  OutgoingOrder(), // 5
  Staff(), // 6
  ProductionDepartment(), // 7
  StoreDepartment(), // 8
  TransferDepartment(), // 9
  HumanResourcesDepartment(), //10
  Barcode(), //11
  Reports(), //12
  Bills(), //13
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: const [AppSidebar(), RightSide()],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int indexContent = Provider.of<States>(context).indexContent;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.lightGrey),
        child: Column(children: [
          WindowTitleBarBox(
            child: Row(
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          Expanded(
            child: contents[indexContent],
          ),
        ]),
      ),
    );
  }
}

/// KAPATMA ALTA ALMA VE TAM EKRAN YAPMA BUTONLARI BUNDAN SONRASI

final buttonColors = WindowButtonColors(
    iconNormal: AppColors.lightPrimary,
    mouseOver: AppColors.lightPrimary,
    mouseDown: AppColors.lightPrimary,
    iconMouseOver: AppColors.lightSecondary,
    iconMouseDown: AppColors.lightPrimary);

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: AppColors.lightPrimary,
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
