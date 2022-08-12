import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/widgets/app_sidebar.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';

const borderColor = AppColors.lightSecondary;

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

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
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.lightGrey),
        child: Column(children: [
          WindowTitleBarBox(
            child: Row(
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          Text('asdfghj'),

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