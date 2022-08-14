import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FluentIcons.people_team_24_regular),
        title: const Text("Personel"),
      ),
    );
  }
}
