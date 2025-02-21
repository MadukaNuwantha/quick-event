import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/dashboard/dashboard_organizer_tile.dart';
import 'package:app/presentation/widgets/dashboard/dashboard_post_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DashboardHomeScreen({super.key, required this.scaffoldKey});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  final List<String> imageUrls = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: ScreenSize.width(context) * 0.5,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageUrls.map((url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        url,
                        fit: BoxFit.fill,
                        width: ScreenSize.width(context),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppImages.imagePlaceholder,
                            fit: BoxFit.fill,
                            width: ScreenSize.width(context),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${imageUrls.length}',
                      style: GoogleFonts.inter(
                        color: AppColors.darkGrey,
                        fontSize: ScreenSize.textScaleFactor(context, 14),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Name',
                        style: GoogleFonts.inter(
                          color: AppColors.darkGrey,
                          fontSize: ScreenSize.textScaleFactor(context, 26),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '56 OMally Road, ST LEONARDS, 2065, NSW',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.lightGrey,
                          fontSize: ScreenSize.textScaleFactor(context, 14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Organizers',
                        style: GoogleFonts.inter(
                          color: AppColors.darkGrey,
                          fontSize: ScreenSize.textScaleFactor(context, 22),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DashboardOrganizerTile(),
                      DashboardOrganizerTile(),
                      DashboardOrganizerTile(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Photos',
                            style: GoogleFonts.inter(
                              color: AppColors.darkGrey,
                              fontSize: ScreenSize.textScaleFactor(context, 22),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'All Photos',
                                style: GoogleFonts.inter(
                                  color: AppColors.primary,
                                  fontSize: ScreenSize.textScaleFactor(context, 16),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                  DashboardPostTile(),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 0.5,
              color: AppColors.lightGrey,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push('/posts');
              },
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '10',
                      style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontSize: ScreenSize.textScaleFactor(context, 22),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Posts',
                      style: GoogleFonts.inter(
                        color: AppColors.darkGrey,
                        fontSize: ScreenSize.textScaleFactor(context, 12),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
