import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class SearchTextFormField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final double errorHeight;
  final int? maxlength;
  final Color backgroundColor;
  final bool autofocus;
  final bool enabled;
  final TextAlign textAlign;
  final Key? key;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SearchTextFormField({
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.errorHeight = 1,
    this.maxlength,
    this.autofocus = false,
    this.enabled = true,
    this.key,
    this.textAlign = TextAlign.left,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      enabled: enabled,
      autofocus: autofocus,
      maxLength: maxlength,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      focusNode: focusNode,
      validator: validator as dynamic,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: textInputAction,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 15.0),
      textAlign: textAlign,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: errorHeight),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.transparent,
          ),
        ),

        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        filled: true,
        fillColor: backgroundColor,
        isDense: true,
        // enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
