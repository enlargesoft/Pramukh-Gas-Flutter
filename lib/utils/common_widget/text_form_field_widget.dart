import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app_text_style.dart';
import '../colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.borderColor,
    this.filledColor,
    this.enabled,
    this.readonly,
    this.filled,
    this.scropadding,
    this.textAlign = TextAlign.left,
    this.contentPadding,
  }) : super(key: key);
  final EdgeInsets? scropadding;
  final Key? fieldKey;
  final bool? readonly;
  final String? hintText;
  final String? labelText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.022, bottom: Get.height * 0.011),
            child: Text(
              labelText ?? "",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: Get.height * 0.017,
                  color: Color(0xFF060E30)),
            ),
          ),
        textFormField(
          fieldKey: fieldKey,
          focusNode: focusNode,
          hintText: hintText,
          scropadding: scropadding,
          filled: filled,
          controller: controller,
          borderRaduis: 10,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          maxLength: maxLength,
          maxLines: maxLines,
          enabled: enabled ?? true,
          readonly: readonly,
          textInputAction: textInputAction,
          textAlign: textAlign,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          contentPadding:
              contentPadding ?? const EdgeInsets.fromLTRB(20, 15, 10, 15),
          textStyle: textStyle,
          borderColor: borderColor,
          filledColor: filledColor,
        ),
      ],
    );
  }
}

TextFormField textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final double? borderRaduis = 0,
  final bool? enabled,
  final bool? filled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Color? borderColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? border,
  final EdgeInsetsGeometry? contentPadding,
  final bool? readonly,
  final EdgeInsets? scropadding,
}) {
  var _width = Get.width;
  var _height = Get.height;
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    scrollPadding: scropadding ?? EdgeInsets.zero,
    key: fieldKey,
    readOnly: readonly ?? false,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: primaryBlack,
    cursorHeight: 20,
    style: textStyle ?? TextStyle(color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      enabled: enabled ?? true,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
      filled: filled ?? false,
      errorMaxLines: 5,
      contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 10),
      errorStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.016,
          color: Colors.red),
      hintText: hintText,
      hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.016,
          color: Color(0xFF9CA3AF)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFD1D5DB))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFD1D5DB))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFD1D5DB))),
    ),
  );
}
