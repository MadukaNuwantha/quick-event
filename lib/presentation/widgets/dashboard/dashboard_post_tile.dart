import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPostTile extends StatelessWidget {
  final PostEntity postEntity;
  const DashboardPostTile({super.key, required this.postEntity});

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
            // Image
            Image.asset(
              AppImages.imagePlaceholder,
              height: ScreenSize.width(context) * 0.6 / 2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // Text Content
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    postEntity.title,
                    style: GoogleFonts.inter(
                      color: AppColors.darkGrey,
                      fontSize: ScreenSize.textScaleFactor(context, 16),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  // Body
                  Text(
                    postEntity.body,
                    style: GoogleFonts.inter(
                      color: AppColors.darkGrey,
                      fontSize: ScreenSize.textScaleFactor(context, 14),
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
