import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/widgets/app_form.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.lightGrey),
        child: ListView(children: [
          WindowTitleBarBox(
            child: Row(
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(150.0),
            child: Column(
              children: [
                AppForm.appTextFormField(
                  label: 'label',
                  hint: 'hint',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 35),
                AppForm.appTextFormField(
                  label: 'label',
                  hint: 'hint',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "home_view");
                  },
                  child: const Text('giriş yap'),
                ),
              ],
            ),
          )
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
