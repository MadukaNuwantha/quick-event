import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/pages/dashboard_home_screen.dart';
import 'package:app/presentation/pages/dashboard_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _dashboardScreenList = [
    DashboardHomeScreen(),
    DashboardProfileScreen(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_outlined, 'title': 'Home'},
    {'icon': Icons.person_outline, 'title': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _dashboardScreenList[_selectedIndex],
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        color: AppColors.darkGrey,
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_navItems.length, (index) {
                return _buildNavItem(
                  _navItems[index]['icon']!,
                  _navItems[index]['title']!,
                  index,
                );
              }),
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
