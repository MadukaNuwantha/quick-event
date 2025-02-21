import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardOrganizerTile extends StatelessWidget {
  const DashboardOrganizerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: AppColors.lightGrey,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              AppImages.profilePlaceholder,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.inter(
                    color: AppColors.darkGrey,
                    fontSize: ScreenSize.textScaleFactor(context, 16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'email@email.com',
                  style: GoogleFonts.inter(
                    color: AppColors.mediumGrey,
                    fontSize: ScreenSize.textScaleFactor(context, 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.message_outlined,
            size: 20,
            color: AppColors.mediumGrey,
          ),
        ],
      ),
    );
  }
}
