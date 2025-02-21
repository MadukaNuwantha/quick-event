import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = "Version ${packageInfo.version}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenSize.width(context) * 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
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
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.1,
                  color: AppColors.lightGrey,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.rotate(
                          angle: 3.1416,
                          child: Icon(
                            Icons.logout,
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Logout',
                          style: GoogleFonts.inter(
                            color: AppColors.primary,
                            fontSize: ScreenSize.textScaleFactor(context, 14),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  _appVersion,
                  style: GoogleFonts.inter(
                    color: AppColors.mediumGrey,
                    fontSize: ScreenSize.textScaleFactor(context, 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
