import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.obsecureText,
      this.controller,
      this.onChanged,
      this.validator, this.suffixIcon});
  final String hint;
  final Widget? suffixIcon;
  final bool obsecureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
