import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş SAYFASI'),
      ),
      body: ElevatedButton(
        onPressed: () {Navigator.pushReplacementNamed(context, "panel_view");},
        child: const Text('giriş yap'),
      ),
    );
  }
}
