import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final void Function()? onTapLeft;
  final void Function()? onTapRight;

  const CustomAppBar({
    super.key,
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.onTapLeft,
    this.onTapRight,
  });

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.lightGrey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: leftIcon != null
                    ? GestureDetector(
                        onTap: onTapLeft,
                        child: Icon(
                          leftIcon!,
                          size: 25,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: Center(
                  child: title != null
                      ? Text(
                          title!,
                          style: GoogleFonts.inter(
                            fontSize: ScreenSize.textScaleFactor(context, 16),
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              SizedBox(
                width: 50,
                child: rightIcon != null
                    ? GestureDetector(
                        onTap: onTapRight,
                        child: Icon(
                          rightIcon!,
                          size: 25,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
