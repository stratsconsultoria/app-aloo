import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String)? onSubmitted;
  final Function(String)? onChage;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final List<TextInputFormatter>? maskFormatter;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onSubmitted,
    this.onChage,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.maskFormatter,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.amber,
          labelText: label,
          isDense: true,
          suffixIcon: suffixIcon,
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
      ),
    );
  }
}
