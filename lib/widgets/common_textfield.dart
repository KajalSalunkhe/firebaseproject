import 'package:firebaseproject/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    Key? key,
    this.hinttext,
    this.controller,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.code,
    // this.textInputType,
    this.onFieldSubmitted,
    this.enabledBorder,
    this.focusedBorder,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.contentPadding,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.autoFocus,
    this.autofillHints,
    this.borderRadius,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
  }) : super(key: key);

  final String? hinttext;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
//   final TextInputType? textInputType;
  final Function(String)? onFieldSubmitted;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onTap;
  final bool enabled;
  final bool readOnly;
  final bool? autoFocus;
  final Iterable<String>? autofillHints;
  final String? code;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        autofocus: autoFocus ?? false,
        autofillHints: autofillHints,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        onTap: onTap,
        // controller: phoneController,
        enabled: enabled,
        keyboardType: keyboardType ?? TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        maxLength: maxLength,

        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          counterText: "",
          hintText: hinttext,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
          errorMaxLines: 3,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.darkPrimary),
            borderRadius: borderRadius ?? BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.darkPrimary),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
