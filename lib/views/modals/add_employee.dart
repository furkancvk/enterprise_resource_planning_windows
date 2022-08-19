import 'package:erp_windows/models/employee.dart';
import 'package:erp_windows/services/employee_service.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../widgets/app_alerts.dart';
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
                            isRequired: true,
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
                            isRequired: true,
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
                            isRequired: true,
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
                  isRequired: true,
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
            onPressed: addEmployee,
            label: const Text("Kaydet"),
            icon: const Icon(FluentIcons.save_24_regular),
          ),
        ),
      ],
    );
  }
  void addEmployee() {
    if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _departmentController.text.isNotEmpty) {
      Employee employeeData = Employee(
          employeeId: 0,
          firstName: _firstNameController.text.toLowerCase(),
          lastName: _lastNameController.text.toLowerCase(),
          email: _emailController.text.toLowerCase(),
          phoneNumber: _phoneNumberController.text.toLowerCase(),
          departmentName: _departmentController.text.toLowerCase(),
          imageUrl: "",
          createdAt: "",
          updatedAt: "",
      );
      EmployeeService.addEmployee(employeeData).then((value) {
        if (value["success"]){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              padding: const EdgeInsets.all(0),
              content: AppAlerts.success(value["message"]),
              duration: const Duration(milliseconds: 1500),
              backgroundColor: AppColors.lightSecondary,
            ),
          );
        }else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              padding: const EdgeInsets.all(0),
              content: AppAlerts.error(value["message"]),
              duration: const Duration(milliseconds: 1500),
              backgroundColor: AppColors.lightSecondary,
            ),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(0),
          content: AppAlerts.warning('Lütfen zorunlu alanları doldurunuz.'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: AppColors.lightSecondary,
        ),
      );
    }
  }
}
