import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollang_recipe/components/extensions.dart';

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
  final double? leftPadding;
  final String? initialValue;
  final int? maxLines;
  final double? verticalPadding;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      minLines: maxLines,
      maxLines: 1,
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
        hintStyle: s14W400(context).copyWith(
            color:
                Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4)),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.w)),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              width: 0.5),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
