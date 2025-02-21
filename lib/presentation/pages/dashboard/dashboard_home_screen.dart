import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:app/presentation/bloc/event_bloc/event_bloc.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:app/presentation/widgets/dashboard/dashboard_organizer_tile.dart';
import 'package:app/presentation/widgets/dashboard/dashboard_post_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardHomeScreen({super.key, required this.scaffoldKey});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(LoadDashboardData());
  }

  Widget _buildCarousel(List<ImageEntity> eventImages) {
    return Stack(
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
          items: eventImages.map((eventImage) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                eventImage.url,
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
              '${_currentIndex + 1} / ${eventImages.length}',
              style: GoogleFonts.inter(
                color: AppColors.darkGrey,
                fontSize: ScreenSize.textScaleFactor(context, 14),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizers(List<OrganizerEntity> organizers) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: organizers.length,
      itemBuilder: (context, index) {
        return DashboardOrganizerTile(
          organizerEntity: organizers[index],
        );
      },
    );
  }

  Widget _buildPosts(List<PostEntity> posts) {
    return SizedBox(
      height: ScreenSize.width(context) * 0.6,
      child: ListView.builder(
        itemCount: posts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DashboardPostTile(
            postEntity: posts[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (context, state) {
        if (state is EventError) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(state.message),
          );
        }
      },
      builder: (context, state) {
        if (state is EventLoading) {
          return Center(
            child: SpinKitSpinningLines(
              color: AppColors.primary,
              size: 40.0,
            ),
          );
        } else if (state is EventError) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: GoogleFonts.inter(
                color: AppColors.darkGrey,
                fontSize: ScreenSize.textScaleFactor(context, 16),
              ),
            ),
          );
        } else if (state is EventDashboardLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Event Images Carousel
                if (state.eventImages.isNotEmpty) _buildCarousel(state.eventImages),
                SizedBox(height: 10),

                // Event Organizers
                if (state.eventOrganizers.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Organizers',
                          style: GoogleFonts.inter(
                            color: AppColors.darkGrey,
                            fontSize: ScreenSize.textScaleFactor(context, 22),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        _buildOrganizers(state.eventOrganizers),
                      ],
                    ),
                  ),
                SizedBox(height: 20),

                // Event Posts
                if (state.eventPosts.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        _buildPosts(state.eventPosts),
                      ],
                    ),
                  ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: AppColors.lightGrey,
                ),
                SizedBox(height: 20),

                // Posts Count
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/posts');
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          state.eventPosts.length.toString(),
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
          );
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
