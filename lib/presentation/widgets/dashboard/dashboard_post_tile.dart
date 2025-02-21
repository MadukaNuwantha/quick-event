import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPostTile extends StatelessWidget {
  const DashboardPostTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
            width: 0.5,
          ),
        ),
        width: ScreenSize.width(context) * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.imagePlaceholder,
              height: ScreenSize.width(context) * 0.6 / 2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              height: ScreenSize.width(context) * 0.6 / 1.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Image Title',
                    style: GoogleFonts.inter(
                      color: AppColors.darkGrey,
                      fontSize: ScreenSize.textScaleFactor(context, 16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Anyone with symptoms should be tested,Anyone with symptoms should be tested, wherever possible. People who do not have symptoms but have had close...',
                    style: GoogleFonts.inter(
                      color: AppColors.darkGrey,
                      fontSize: ScreenSize.textScaleFactor(context, 14),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
