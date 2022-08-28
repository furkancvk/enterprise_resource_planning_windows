import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:erp_windows/widgets/app_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../services/user_service.dart';
import '../storage/storage.dart';
import '../widgets/app_alerts.dart';

const borderColor = AppColors.lightSecondary;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final SecureStorage secureStorage = SecureStorage();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    secureStorage.readSecureData('rememberMeUsername').then((value) => {
      _usernameController.text = value ?? '',
      if(value != null) isChecked = true,
      if(mounted) setState(() {}),
    });
    secureStorage.readSecureData('rememberMePassword').then((value) => {
      _passwordController.text = value ?? '',
      if(value != null) isChecked = true,
      if(mounted) setState(() {}),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/background-login.jpg",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Align(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment(-2, -8),
                              colors: [
                                AppColors.lightPrimary,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24,
                      left: 24,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Positioned(
                      top: 220,
                      left: 40,
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 260,
                                height: 32,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 48),
                                decoration: const BoxDecoration(
                                  color: AppColors.lightSecondary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Kolay ve anlaşılır panel yönetimi",
                                  style: AppText.helperSemiBold,
                                ),
                              ),
                              const Positioned(
                                top: -8,
                                left: -10,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.lightAccent,
                                  radius: 24,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      color: AppColors.lightSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 260,
                                height: 32,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 48),
                                decoration: const BoxDecoration(
                                  color: AppColors.lightSecondary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Hızlı ve güvenilir stok takibi",
                                  style: AppText.helperSemiBold,
                                ),
                              ),
                              const Positioned(
                                top: -8,
                                left: -10,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.lightAccent,
                                  radius: 24,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      color: AppColors.lightSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 260,
                                height: 32,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 48),
                                decoration: const BoxDecoration(
                                  color: AppColors.lightSecondary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Gerçekçi ve ayrıntılı istatistikler",
                                  style: AppText.helperSemiBold,
                                ),
                              ),
                              const Positioned(
                                top: -8,
                                left: -10,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.lightAccent,
                                  radius: 24,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      color: AppColors.lightSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 260,
                                height: 32,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 48),
                                decoration: const BoxDecoration(
                                  color: AppColors.lightSecondary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Geniş çaplı raporlama sistemi",
                                  style: AppText.helperSemiBold,
                                ),
                              ),
                              const Positioned(
                                top: -8,
                                left: -10,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.lightAccent,
                                  radius: 24,
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      color: AppColors.lightSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 24,
                      child: Text(
                        "Copyright © Solvio Yazılım",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: AppColors.lightSecondary,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  WindowTitleBarBox(
                    child: Row(
                      children: [
                        Expanded(child: MoveWindow()),
                        const WindowButtons(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 120),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hoş geldiniz", style: AppText.titleSemiBold),
                            const SizedBox(height: 4),
                            Text(
                                "Giriş yapmak için kullanıcı adınızı & şifrenizi giriniz.",
                                style: AppText.context),
                            const SizedBox(height: 32),
                            AppForm.appTextFormFieldRegex(
                              formatter: FilteringTextInputFormatter.allow(
                                  RegExp(r'\S')),
                              label: "Kullanıcı Adı",
                              hint: "ör. isimsoyisim",
                              controller: _usernameController,
                            ),
                            const SizedBox(height: 24),
                            PasswordFieldWithVisibility(
                                controller: _passwordController),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 8),
                                Text("Beni Hatırla", style: AppText.label)
                              ],
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() => isLoading = true);
                                  logIn();
                                },
                                child: isLoading
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        child: const CircularProgressIndicator(
                                          color: AppColors.lightSecondary,
                                          strokeWidth: 3,
                                        ),
                                      )
                                    : const Text("Giriş Yap"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logIn() async {

    if(isChecked) {
      await secureStorage.writeSecureData('rememberMeUsername', _usernameController.text);
      await secureStorage.writeSecureData('rememberMePassword', _passwordController.text);
    } else {
      await secureStorage.deleteSecureData('rememberMeUsername');
      await secureStorage.deleteSecureData('rememberMePassword');
    }

    try {
      if (_formKey.currentState!.validate()) {
        await UserService.logIn(
          _usernameController.text,
          _passwordController.text,
        ).then(
          (value) => {
            if (value["success"])
              {
                setState(() => isLoading = false),
                Navigator.pushReplacementNamed(context, 'home_view'),
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: const EdgeInsets.all(0),
                    content: AppAlerts.success(value["message"]),
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: AppColors.lightSecondary,
                  ),
                ),
                // AppAlerts.toast(message: value["message"]),
              }
            else
              {
                setState(() => isLoading = false),
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: const EdgeInsets.all(0),
                    content: AppAlerts.error(value["message"]),
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: AppColors.lightSecondary,
                  ),
                ),
                // AppAlerts.toast(message: value["message"]),
              },
          },
        );
      } else
        setState(() => isLoading = false);
    } on SocketException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(
            "İnternet bağlantınızı kontrol ediniz.",
            style: AppText.contextSemiBold,
          ),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: AppColors.lightSecondary,
        ),
      );
      // AppAlerts.toast(message: "İnternet bağlantınızı kontrol ediniz.");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(e.toString()),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: AppColors.lightSecondary,
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}

/// Kapatma, küçültme ve alta alma butonların kodları

final buttonColors = WindowButtonColors(
  iconNormal: AppColors.lightPrimary,
  mouseOver: AppColors.lightPrimary,
  mouseDown: AppColors.lightPrimary,
  iconMouseOver: AppColors.lightSecondary,
  iconMouseDown: AppColors.lightPrimary,
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: AppColors.lightPrimary,
  iconMouseOver: Colors.white,
);

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
