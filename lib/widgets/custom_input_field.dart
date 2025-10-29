import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;

  const CustomInputField({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1,
      ),
    );

    return TextField(
      controller: controller,
      obscureText: obscureText,
      enableSuggestions: !obscureText,
      autocorrect: !obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
      onChanged: onChanged,
    );
  }
}
