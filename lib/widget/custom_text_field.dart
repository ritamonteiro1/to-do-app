import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.prefix,
    required this.suffix,
    required this.obscure,
    required this.textInputType,
    required this.onChanged,
    required this.enable,
    Key? key,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(32)),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enable,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: suffix),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
