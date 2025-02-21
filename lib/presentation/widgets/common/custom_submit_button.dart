import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;

  const CustomSubmitButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: 20,
                color: foregroundColor ?? AppColors.white,
              ),
              SizedBox(width: 8), // Space between icon and text
            ],
            Text(
              text,
              style: GoogleFonts.inter(
                color: foregroundColor ?? AppColors.white,
                fontSize: ScreenSize.textScaleFactor(context, 16),
                fontWeight: FontWeight.w600,
              ),
            ),
            if (suffixIcon != null) ...[
              SizedBox(width: 8), // Space between text and icon
              Icon(
                suffixIcon,
                size: 20,
                color: foregroundColor ?? AppColors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
