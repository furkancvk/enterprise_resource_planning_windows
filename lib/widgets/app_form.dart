import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
            isRequired
                ? const Text("*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightError,
                    ))
                : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${label.toLowerCase()} alanı boş bırakılamaz.";
            } else if (isEmail) {
              return FormValidation.validateEmail(value);
            } else if (isPassword) {
              return FormValidation.validatePassword(value);
            } else {
              return null;
            }
          },
          expands: isExpands,
          maxLines: maxLines,
          enabled: isEnabled,
          controller: controller,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  static Widget appTextFormFieldRegex({
    required TextInputFormatter formatter,
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
            isRequired
                ? const Text("*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightError,
                    ))
                : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${label.toLowerCase()} alanı boş bırakılamaz.";
            } else if (isEmail) {
              return FormValidation.validateEmail(value);
            } else if (isPassword) {
              return FormValidation.validatePassword(value);
            } else {
              return null;
            }
          },
          expands: isExpands,
          maxLines: maxLines,
          enabled: isEnabled,
          controller: controller,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          inputFormatters: [formatter],
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
            isRequired
                ? const Text("*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightError,
                    ))
                : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${label.toLowerCase()} alanı boş bırakılamaz.";
            } else if (isEmail) {
              return FormValidation.validateEmail(value);
            } else if (isPassword) {
              return FormValidation.validatePassword(value);
            } else {
              return null;
            }
          },
          enabled: isEnabled,
          controller: controller,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
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
            isRequired
                ? const Text("*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightError,
                    ))
                : const Text(""),
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
        suffixIcon: const Icon(
          FluentIcons.search_24_filled,
          color: AppColors.lightPrimary,
        ),
        hintText: hint,
      ),
      suggestions: suggestions,
      textSubmitted: (String value) {},
    );
  }

  static Widget appTextFormFieldRegexNumber({
    required String label,
    required String hint,
    required TextEditingController controller,
    required GlobalKey<AutoCompleteTextFieldState<String>> key,
    required TextInputType keyboardType,
    bool isRequired = false,
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppText.labelSemiBold),
            isRequired
                ? const Text("*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightError,
                ))
                : const Text(""),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'([1-9][0-9]*)'))
          ],
          keyboardType: keyboardType,
          key: key,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
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
            isRequired
                ? const Text("*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightError,
                    ))
                : const Text(""),
          ],
        ),
        DropdownSearch<String>(
          enabled: isEnabled,
          popupProps: PopupProps.menu(
            menuProps: const MenuProps(
                backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
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
  const PasswordFieldWithVisibility({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordFieldWithVisibility> createState() =>
      _PasswordFieldWithVisibilityState();
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
                  icon: Icon(!isObscure
                      ? FluentIcons.eye_24_regular
                      : FluentIcons.eye_off_24_regular),
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

class NumberTextField extends StatefulWidget {
  final int amount;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int min;
  final int max;
  final int step;
  final double arrowsWidth;
  final double arrowsHeight;
  final EdgeInsets contentPadding;
  final double borderWidth;
  final ValueChanged<int?>? onChanged;

  const NumberTextField({
    Key? key,
    required this.amount,
    this.controller,
    this.focusNode,
    this.min = 0,
    this.max = 9999999999,
    this.step = 1,
    this.arrowsWidth = 24,
    this.arrowsHeight = kMinInteractiveDimension,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.borderWidth = 2,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _canGoUp = false;
  bool _canGoDown = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.amount.toString();
    _focusNode = widget.focusNode ?? FocusNode();
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  void didUpdateWidget(covariant NumberTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = widget.controller ?? _controller;
    _focusNode = widget.focusNode ?? _focusNode;
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            maxLength:
                widget.max.toString().length + (widget.min.isNegative ? 1 : 0),
            decoration: InputDecoration(
                counterText: '',
                isDense: true,
                filled: true,
                fillColor: AppColors.lightSecondary,
                contentPadding: widget.contentPadding.copyWith(right: 0),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: widget.arrowsHeight,
                    maxWidth: widget.arrowsWidth + widget.contentPadding.right),
                suffixIcon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(widget.borderWidth),
                            bottomRight: Radius.circular(widget.borderWidth))),
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        top: widget.borderWidth,
                        right: widget.borderWidth,
                        bottom: widget.borderWidth,
                        left: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                      onTap:
                                          _canGoUp ? () => _update(true) : null,
                                      child: Opacity(
                                          opacity: _canGoUp ? 1 : .5,
                                          child: const Icon(
                                              Icons.arrow_drop_up))))),
                          Expanded(
                              child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                      onTap: _canGoDown
                                          ? () => _update(false)
                                          : null,
                                      child: Opacity(
                                          opacity: _canGoDown ? 1 : .5,
                                          child: const Icon(
                                              Icons.arrow_drop_down))))),
                        ]))),
            maxLines: 1,
            onChanged: (value) {
              final intValue = int.tryParse(value);
              widget.onChanged?.call(intValue);
              _updateArrows(intValue);
            },
            inputFormatters: [
              _NumberTextInputFormatter(widget.min, widget.max)
            ]),
      );

  void _update(bool up) {
    var intValue = int.tryParse(_controller.text);
    intValue == null
        ? intValue = 0
        : intValue += up ? widget.step : -widget.step;
    _controller.text = intValue.toString();
    _updateArrows(intValue);
    _focusNode.requestFocus();
  }

  void _updateArrows(int? value) {
    final canGoUp = value == null || value < widget.max;
    final canGoDown = value == null || value > widget.min;
    if (_canGoUp != canGoUp || _canGoDown != canGoDown) {
      setState(() {
        _canGoUp = canGoUp;
        _canGoDown = canGoDown;
      });
    }
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  _NumberTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (const ['-', ''].contains(newValue.text)) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null) return oldValue;
    if (intValue < min) return newValue.copyWith(text: min.toString());
    if (intValue > max) return newValue.copyWith(text: max.toString());
    return newValue.copyWith(text: intValue.toString());
  }
}
