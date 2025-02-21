import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? validate;
  final IconData? prefixIcon;

  const CustomPasswordField({
    super.key,
    required this.controller,
    this.hintText,
    this.validate,
    this.prefixIcon,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        fillColor: AppColors.lightPrimary,
        filled: true,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          color: AppColors.lightGrey,
          fontSize: ScreenSize.textScaleFactor(context, 16),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.0),
                child: Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: _focusNode.hasFocus ? AppColors.primary : AppColors.mediumGrey,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: toggleObscureText,
            child: Icon(
              obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              size: 20,
              color: _focusNode.hasFocus ? AppColors.primary : AppColors.mediumGrey,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        focusColor: AppColors.primary,
      ),
      obscureText: obscureText,
      cursorColor: AppColors.primary,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (widget.validate == true && (value == null || value.isEmpty)) {
          return 'Please fill this field to continue';
        }
        return null;
      },
    );
  }
}
