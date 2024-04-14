import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChage;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Color? color;
  final bool obscureText;
  final List<TextInputFormatter>? maskFormatter;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomTextField({
    required this.label,
    required this.controller,
    this.onSubmitted,
    this.onChage,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.maskFormatter,
    this.obscureText = false,
    this.suffixIcon,
    this.color,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        suffixIcon: suffixIcon,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: color ?? Theme.of(context).cardColor,
      ),
      autocorrect: false,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      enabled: enabled,
      inputFormatters: maskFormatter,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmitted,
      onChanged: onChage,
    );
  }
}
