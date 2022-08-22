import 'dart:io';

import 'package:erp_windows/models/employee.dart';
import 'package:erp_windows/services/employee_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path/path.dart' as path;

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
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  File? imageFile;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      imageFile = file;
      setState(() {});
    }
  }

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
                          imageFile != null ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.lightPrimary.withOpacity(0.04),
                                  border: Border.all(
                                    color: AppColors.lightPrimary,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.file(imageFile!, width: 200, height: 150, fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: -8,
                                  right: -8,
                                  child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    imageFile = null;
                                  });
                                },
                                icon: const Icon(FluentIcons.dismiss_circle_20_filled, color: AppColors.lightPrimary),
                              ),
                              )
                            ],
                          ) :
                          AppCards.addImgCard(
                              onTap: () => pickFile()),
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

  Future<String> uploadFile() async {
    if (imageFile == null) return "";

    final fileName = path.basename(imageFile!.path);
    final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref(destination).child('file/');
    await ref.putFile(imageFile!);
    var url = FirebaseStorage.instance.ref(destination).child('file/').getDownloadURL();

    return url;

  }

  void addEmployee() async {
    if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _departmentController.text.isNotEmpty) {
      Employee employeeData = Employee(
          employeeId: 0,
          firstName: _firstNameController.text.toLowerCase(),
          lastName: _lastNameController.text.toLowerCase(),
          email: _emailController.text.toLowerCase(),
          phoneNumber: _phoneNumberController.text.toLowerCase(),
          departmentName: _departmentController.text.toLowerCase(),
          // imageName: "",
          // imageData: "",
          imageUrl: await uploadFile(),
          createdAt: "",
          updatedAt: "",
      );
      EmployeeService.addEmployee(employeeData, null).then((value) {
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
