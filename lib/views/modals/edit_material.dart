import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../design/app_text.dart';
import '../../models/app_material.dart';
import '../../services/material_service.dart';
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

  File? imageFile;
  bool isLoading = false ;
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
    _nameController.text = Helpers.titleCase(widget.material.materialName);
    _typeController.text = Helpers.titleCase(widget.material.typeName);
    _amountController.text = widget.material.amount.toString();
    _unitController.text = Helpers.titleCase(widget.material.unitName);
    _sizeController.text = widget.material.sizeName;
    _colorController.text = Helpers.titleCase(widget.material.colorName);
    _explanationController.text = widget.material.description;

    return AlertDialog(
      title: Text("Hammadde Düzenle", style: AppText.titleSemiBold),
      content: SizedBox(
        // height: 560,
        width: 360,
        child: ListView(
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
                    isRequired: true,
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
                    isRequired: true,
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
                  imageFile != null ?
                  Stack(
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
                  AppCards.addImgCard(onTap: () => pickFile()),
                  const SizedBox(height: 24),
                  AppForm.appTextFormField(
                    label: "Miktar Birimi",
                    hint: "ör. Adet",
                    controller: _unitController,
                    isRequired: true,
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
          child: isLoading ? ElevatedButton(
              onPressed: (){}
              , child: Container(
            height: 20,
            width: 20,
            child: const CircularProgressIndicator(
              color: AppColors.lightSecondary,
              strokeWidth: 3,
            ),
          )) : ElevatedButton.icon(
            onPressed: (){
              setState(()=>isLoading=true);
              updateMaterial();},
            icon: const Icon(FluentIcons.save_24_regular),
            label: const Text("Kaydet"),
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
    if(_nameController.text.isNotEmpty && _amountController.text.isNotEmpty && _unitController.text.isNotEmpty) {
      AppMaterial materialData = AppMaterial(
          materialId: widget.material.materialId,
          referenceNumber: widget.material.referenceNumber,
          // imageName: "",
          // imageData: "",
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

      MaterialService.updateMaterial(materialData, null).then((value) {
        if (value["success"]){
          setState(()=>isLoading=false);
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
          setState(()=>isLoading=false);
          Navigator.pop(context);
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
      setState(()=>isLoading=false);
      Navigator.pop(context);
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
