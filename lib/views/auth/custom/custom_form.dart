import 'package:flutter/material.dart';

import '../../../common_custom/const_text_style.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:AppTextStyles.heading2,

        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      obscureText: isPassword,
      validator: validator,
    );
  }
}
