import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/pages/dashboard/dashboard_home_screen.dart';
import 'package:app/presentation/pages/dashboard/dashboard_profile_screen.dart';
import 'package:app/presentation/widgets/common/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> dashboardScreenList = [
      DashboardHomeScreen(scaffoldKey: scaffoldKey),
      DashboardProfileScreen(scaffoldKey: scaffoldKey),
    ];
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: dashboardScreenList[_selectedIndex],
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        color: AppColors.darkGrey,
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_outlined, 'Home', 0),
                _buildNavItem(Icons.person_outline, 'Profile', 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
          ),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: ScreenSize.textScaleFactor(context, 14),
              color: isSelected ? AppColors.primary : AppColors.lightGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
