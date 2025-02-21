import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(state.message),
          );
        } else if (state is Unauthenticated) {
          GoRouter.of(context).push('/login');
        }
      },
      builder: (context, state) {
        return state is AuthLoading
            ? SpinKitSpinningLines(
                color: AppColors.primary,
                size: 40.0,
              )
            : BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      errorSnackBar(state.message),
                    );
                  }
                },
                builder: (context, state) {
                  return state is UserLoading
                      ? SpinKitSpinningLines(
                          color: AppColors.primary,
                          size: 40.0,
                        )
                      : Drawer(
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
                                          if (state is UserLoaded)
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${state.userEntity.firstName} ${state.userEntity.lastName}',
                                                    style: GoogleFonts.inter(
                                                      color: AppColors.darkGrey,
                                                      fontSize: ScreenSize.textScaleFactor(context, 16),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    state.userEntity.email,
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
                                        onTap: () {
                                          context.read<AuthBloc>().add(LogoutUserEvent());
                                        },
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
                },
              );
      },
    );
  }
}
