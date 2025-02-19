import 'dart:async';

import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        GoRouter.of(context).pushReplacement('/login');
      },
    );
  }

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
                  'Quick Event',
                  style: GoogleFonts.montaguSlab(
                    color: AppColors.primary,
                    fontSize: ScreenSize.textScaleFactor(context, 40),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                SpinKitSpinningLines(
                  color: AppColors.primary,
                  size: 40.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
