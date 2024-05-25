import 'package:flutter/material.dart';

// Define a custom color for your theme
class AppColors {
  static const primaryColor = Color(0xFF000000);  // Black color for background
  static const textColor = Color(0xFFFFFFFF);     // White color for text
}

// Define common text styles
class AppTextStyles {
  static const heading = TextStyle(
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const bodyText = TextStyle(
    color: AppColors.textColor,
    fontSize: 16,
  );
}
