import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../models/app_material.dart';
import '../../models/app_process.dart';
import '../../models/user.dart';
import '../../services/base_service.dart';
import '../../services/material_service.dart';
import '../../services/process_service.dart';
import '../../storage/storage.dart';
import '../../utils/helpers.dart';
import '../../widgets/app_alerts.dart';
import '../../widgets/app_cards.dart';
import '../../widgets/app_form.dart';

class UpdateMaterial extends StatefulWidget {
  const UpdateMaterial({Key? key, required this.material}) : super(key: key);

  final AppMaterial material;
  @override
  State<UpdateMaterial> createState() => _UpdateMaterialState();
}

class _UpdateMaterialState extends State<UpdateMaterial> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();
  int currentStock = 0;


  @override
  Widget build(BuildContext context) {
    _nameController.text = Helpers.titleCase(widget.material.materialName);
    _typeController.text = Helpers.titleCase(widget.material.typeName);
    _amountController.text = widget.material.amount.toString();
    _unitController.text = Helpers.titleCase(widget.material.unitName);
    _sizeController.text = widget.material.sizeName;
    _colorController.text = Helpers.titleCase(widget.material.colorName);
    _explanationController.text = widget.material.description;

    String imageUrl = '${BaseService.baseUrl}/images/materials/${widget.material.materialId}/${widget.material.imageUrl}' ;

    return AlertDialog(
      title: Text("Hammadde Verisi Güncelle", style: AppText.titleSemiBold),
      content: SizedBox(
        height: 380,
        width: 360,
        child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  AppForm.appTextFormField(
                    label: "İsim",
                    hint: "ör. Gizli Ayak",
                    controller: _nameController,
                  ),
                  const SizedBox(height: 24),
                  AppForm.appTextFormField(
                    label: "Cins",
                    hint: "ör. Uzun",
                    controller: _typeController,
                  ),
                  const SizedBox(height: 24),
                  AppForm.appTextFormFieldRegexNumber(
                    label: "Miktar",
                    hint: "ör. 380",
                    controller: _amountController,
                    key: GlobalKey(),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  AppForm.appTextFormField(
                    label: "Boyut",
                    hint: "ör. 12 cm",
                    controller: _sizeController,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  // const ImagePickerWidget(),
                  Container(
                    width: 171,
                    height: 156,
                    decoration: BoxDecoration(
                      color: AppColors.lightPrimary.withOpacity(0.04),
                      border: Border.all(
                        color: AppColors.lightPrimary,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 24),
                  AppForm.appTextFormField(
                    label: "Miktar Birimi",
                    hint: "ör. Adet",
                    controller: _unitController,
                  ),
                  const SizedBox(height: 24),
                  AppForm.appTextFormField(
                    label: "Renk",
                    hint: "ör. Ceviz",
                    controller: _colorController,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppForm.appTextFormField(
          maxLines: 3,
          label: "Açıklama",
          hint: "Ekstra bilgileri buraya ekleyebilirsiniz.",
          controller: _explanationController,
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: updateMaterial,
            child: const Text("Güncelle"),
          ),
        ),
      ],
    ),
      ),
    );
  }

  Future<String> getUserId() async {
    final SecureStorage secureStorage = SecureStorage();
    return await secureStorage.readSecureData('userId');
  }

  void updateMaterial() {
    if(_nameController.text.isNotEmpty || _typeController.text.isNotEmpty || _unitController.text.isNotEmpty ||_amountController.text.isNotEmpty ||_colorController.text.isNotEmpty || _sizeController.text.isNotEmpty ||_explanationController.text.isNotEmpty) {
      AppMaterial materialData = AppMaterial(
          materialId: widget.material.materialId,
          referenceNumber: widget.material.referenceNumber,
          imageUrl: widget.material.imageUrl,
          materialName: _nameController.text.toLowerCase(),
          typeName: _typeController.text.toLowerCase(),
          unitName: _unitController.text.toLowerCase(),
          amount: int.parse(_amountController.text),
          colorName: _colorController.text.toLowerCase(),
          sizeName: _sizeController.text.toLowerCase(),
          description: _explanationController.text,
          createdAt: widget.material.createdAt,
          updatedAt: widget.material.createdAt
      );

      MaterialService.updateMaterial(materialData).then((value) {
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
        } else {
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
          content: AppAlerts.warning('Lütfen gerekli alanları doldurunuz.'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: AppColors.lightSecondary,
        ),
      );
    }
  }
}
