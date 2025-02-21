import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostListTile extends StatelessWidget {
  final PostEntity postEntity;
  const PostListTile({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postEntity.title,
            style: GoogleFonts.inter(
              color: AppColors.darkGrey,
              fontSize: ScreenSize.textScaleFactor(context, 16),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            postEntity.body,
            style: GoogleFonts.inter(
              color: AppColors.mediumGrey,
              fontSize: ScreenSize.textScaleFactor(context, 12),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
