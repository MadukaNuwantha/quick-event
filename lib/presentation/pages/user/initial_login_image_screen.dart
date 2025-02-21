import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/common/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialLoginImageScreen extends StatefulWidget {
  const InitialLoginImageScreen({super.key});

  @override
  State<InitialLoginImageScreen> createState() => _InitialLoginImageScreenState();
}

class _InitialLoginImageScreenState extends State<InitialLoginImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Welcome',
                  style: GoogleFonts.inter(
                    color: AppColors.darkGrey,
                    fontSize: ScreenSize.textScaleFactor(context, 32),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You are logged in for the first time and can upload a profile photo',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.lightGrey,
                    fontSize: ScreenSize.textScaleFactor(context, 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 24,
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),
                CustomSubmitButton(
                  text: 'Next',
                  suffixIcon: Icons.arrow_forward,
                  onPressed: () {
                    GoRouter.of(context).push('/initial-login-detail');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
