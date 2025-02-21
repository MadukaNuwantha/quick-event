import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPostScreen extends StatefulWidget {
  const ViewPostScreen({super.key});

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Post',
        leftIcon: Icons.arrow_back,
        onTapLeft: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event Name',
                style: GoogleFonts.inter(
                  color: AppColors.darkGrey,
                  fontSize: ScreenSize.textScaleFactor(context, 16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'This is the comment description This & the content description This is the content description This is the content description',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  color: AppColors.mediumGrey,
                  fontSize: ScreenSize.textScaleFactor(context, 12),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Comments',
                style: GoogleFonts.inter(
                  color: AppColors.darkGrey,
                  fontSize: ScreenSize.textScaleFactor(context, 14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
