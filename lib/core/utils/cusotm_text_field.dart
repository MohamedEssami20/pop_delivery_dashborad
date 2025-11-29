import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.controller,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.validator,
    this.enabled,
    this.prefixIcon,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      maxLength: maxLength,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: validator,
      obscureText: obscureText,
      initialValue: initialValue,
      onSaved: onSaved,
      keyboardType: textInputType,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        counterText: "", // hide counter when maxLength is set
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
        filled: true,
        fillColor: const Color(0xffe6e9e9),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(width: 1, color: Color(0xffe6e9e9)),
    );
  }
}
