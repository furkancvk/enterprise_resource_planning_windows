import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../utils/form_validation.dart';

class AppForm {
  static Widget appTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool isEmail = false,
    bool isRequired = false,
    bool isEnabled = true,
    bool isExpands = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppText.labelSemiBold),
            isRequired ? const Text("*", style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.lightError,
            )) : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          expands: isExpands,
          maxLines: maxLines,
          enabled: isEnabled,
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  static Widget appTextFormFieldIcon({
    required String label,
    required String hint,
    required Icon icon,
    required TextEditingController controller,
    bool isPassword = false,
    bool isEmail = false,
    bool isRequired = false,
    bool isPrefixIcon = true,
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppText.labelSemiBold),
            isRequired ? const Text("*", style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.lightError,
            )) : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          enabled: isEnabled,
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: isPrefixIcon ? icon : null,
            suffixIcon: !isPrefixIcon ? icon : null,
            hintText: hint,
          ),
        ),
      ],
    );
  }

  static Widget appAutoCompleteTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required GlobalKey<AutoCompleteTextFieldState<String>> key,
    required List<String> suggestions,
    bool isRequired = false,
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppText.labelSemiBold),
            isRequired ? const Text("*", style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.lightError,
            )) : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        SimpleAutoCompleteTextField(
          key: key,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          suggestions: suggestions,
          textSubmitted: (String value) {},
          clearOnSubmit: false,
        ),
      ],
    );
  }

  static Widget appAutoCompleteTextFormFieldForSearch({
    required String hint,
    required TextEditingController controller,
    required GlobalKey<AutoCompleteTextFieldState<String>> key,
    required List<String> suggestions,
    bool isRequired = false,
    bool isEnabled = true,
  }) {
    return SimpleAutoCompleteTextField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: const Icon(FluentIcons.search_24_filled, color: AppColors.lightPrimary,),
        hintText: hint,
      ),
      suggestions: suggestions,
      textSubmitted: (String value) {},
      clearOnSubmit: false,
    );
  }

  static Widget appSearchableDropDownField({
    required List<String> items,
    required String label,
    required Function(String?) onChanged,
    required selectedItem,
    bool isRequired = false,
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppText.labelSemiBold),
            isRequired ? const Text("*", style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.lightError,
            )) : const Text(""),
          ],
        ),
        DropdownSearch<String>(
          enabled: isEnabled,
          popupProps: PopupProps.menu(
            menuProps:
            const MenuProps(backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: items,
          onChanged: onChanged,
          selectedItem: selectedItem,
        )
      ],
    );
  }
}

class PasswordFieldWithVisibility extends StatefulWidget {
  const PasswordFieldWithVisibility({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordFieldWithVisibility> createState() => _PasswordFieldWithVisibilityState();
}

class _PasswordFieldWithVisibilityState extends State<PasswordFieldWithVisibility> {
  bool isObscure = true;

  void changePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Şifre", style: AppText.labelSemiBold),
            const SizedBox(height: 4),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "şifre alanı boş bırakılamaz.";
                } else if (value != null || value.isNotEmpty) {
                  return FormValidation.validatePassword(value);
                } else {
                  return null;
                }
              },
              controller: widget.controller,
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: "Şifre 6 ila 18 karakter olmalı",
                suffixIcon: IconButton(
                  onPressed: changePasswordVisibility,
                  icon: Icon(!isObscure ? FluentIcons.eye_24_regular : FluentIcons.eye_off_24_regular),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Text("Şifremi Unuttum", style: AppText.label),
        ),
      ],
    );
  }
}

class IncDecInput extends StatefulWidget {
  const IncDecInput({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<IncDecInput> createState() => _IncDecInputState();
}

class _IncDecInputState extends State<IncDecInput> {
  int number = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = number.toString();

    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 40,
          child: TextFormField(controller: widget.controller),
        ),
        Positioned(
          top: 0,
          right: 4,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    number++;
                  });
                },
                child: const Icon(
                  FluentIcons.chevron_up_24_filled,
                  color: AppColors.lightPrimary,
                  size: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(number > 0) number--;
                  });
                },
                child: const Icon(
                  FluentIcons.chevron_down_24_filled,
                  color: AppColors.lightPrimary,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

