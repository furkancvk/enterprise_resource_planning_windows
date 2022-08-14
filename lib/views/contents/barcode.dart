import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Barcode extends StatelessWidget {
  const Barcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.barcode_scanner_24_regular),
        title: const Text("Etiket"),
      ),
    );
  }
}
