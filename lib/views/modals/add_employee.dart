import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/app_text.dart';
import '../../widgets/app_cards.dart';
import '../../widgets/app_form.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Personel Ekle", style: AppText.titleSemiBold),
      content: SizedBox(
        height: 380,
        width: 360,
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AppForm.appTextFormFieldRegex(
                            formatter:
                            FilteringTextInputFormatter.deny(
                              RegExp(r'([1-9][0-9]*)'),
                            ),
                            label: "İsim",
                            hint: "ör. Ali",
                            controller: _firstNameController,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appTextFormFieldRegex(
                            formatter:
                            FilteringTextInputFormatter.deny(
                              RegExp(r'([1-9][0-9]*)'),
                            ),
                            label: "Soyisim",
                            hint: "ör. Demir",
                            controller: _lastNameController,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appTextFormField(
                            label: "Email",
                            hint: "ör. isim@gmail.com",
                            controller: _emailController,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          const ImagePickerWidget(),
                          const SizedBox(height: 26),
                          AppForm.appTextFormFieldRegex(
                            formatter:
                            FilteringTextInputFormatter.allow(
                              RegExp(r'([1-9][0-9]*)'),
                            ),
                            label: "Telefon",
                            hint: "ör.5123456789",
                            controller: _phoneNumberController,
                          ),
                          const SizedBox(height: 26),
                        ],
                      ),
                    ),
                  ],
                ),
                AppForm.appTextFormField(
                  label: "Birim",
                  hint: "ör. İnsan Kaynakları",
                  controller: _departmentController,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          child: ElevatedButton.icon(
            onPressed: () {},
            label: Text("Kaydet"),
            icon: Icon(FluentIcons.save_24_regular),
          ),
        ),
      ],
    );
  }
}
