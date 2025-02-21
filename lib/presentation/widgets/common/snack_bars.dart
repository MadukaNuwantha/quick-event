import 'package:app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

SnackBar errorSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: AppColors.error,
  );
}

SnackBar successSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: AppColors.primary,
  );
}

SnackBar warningSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: AppColors.warning,
  );
}
