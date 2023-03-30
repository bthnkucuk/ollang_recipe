import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/text_style.dart';

///[MyInputField] is a custom input field widget
class MyInputField extends StatelessWidget {
  const MyInputField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText,
    this.focusNode,
    this.fillColor,
    this.readOnly,
    this.controller,
    this.textInputAction,
    required this.onSubmitted,
    this.disableBorders,
    this.leftPadding,
    this.initialValue,
    this.maxLines,
    this.verticalPadding,
    this.prefixIcon,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String) onSubmitted;
  final Color? fillColor;
  final bool? readOnly;
  final TextEditingController? controller;
  final bool? disableBorders;
  final double? leftPadding;
  final String? initialValue;
  final int? maxLines;
  final double? verticalPadding;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: maxLines,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.search,
      focusNode: focusNode,
      autocorrect: false,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onSubmitted: (value) => onSubmitted(value),
      decoration: InputDecoration(
        prefixIcon: prefixIcon ?? const SizedBox.shrink(),
        errorMaxLines: 5,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: s14W400.copyWith(color: Colors.grey.shade600),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
        border: disableBorders != null
            ? const OutlineInputBorder(borderSide: BorderSide.none)
            : const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
        enabledBorder: disableBorders != null
            ? const OutlineInputBorder(borderSide: BorderSide.none)
            : null,
        contentPadding: EdgeInsets.only(
          top: verticalPadding ?? 0,
          bottom: verticalPadding ?? 0,
          left: leftPadding ?? 15,
        ),
      ),
    );
  }
}
