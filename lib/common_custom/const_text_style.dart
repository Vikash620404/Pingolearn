import 'package:flutter/material.dart';


import 'const_color.dart';

class AppTextStyles {
  // Define different font weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w800;

  // Define text styles
  static TextStyle heading1 = TextStyle(
    fontSize: 19,
    fontWeight: bold,
    color: AppColors.blueColor,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 15,
    fontWeight: medium,
    color: AppColors.blackColor,
  );
  static TextStyle heading4 = TextStyle(
    fontSize: 18,
    fontWeight: medium,
    color: AppColors.blackColor,
  );
}
