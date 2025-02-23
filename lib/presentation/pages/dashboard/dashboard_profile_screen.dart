import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:app/presentation/widgets/common/custom_appbar.dart';
import 'package:app/presentation/widgets/common/custom_drawer.dart';
import 'package:app/presentation/widgets/common/custom_submit_button.dart';
import 'package:app/presentation/widgets/common/custom_text_field.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardProfileScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardProfileScreen({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<DashboardProfileScreen> createState() => _DashboardProfileScreenState();
}

class _DashboardProfileScreenState extends State<DashboardProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(state.message),
          );
        }
        if (state is UserLoaded) {
          _firstNameController.text = state.userEntity.firstName;
          _lastNameController.text = state.userEntity.lastName;
          _emailController.text = state.userEntity.email;
          _phoneController.text = state.userEntity.phoneNumber;
          _addressController.text = state.userEntity.address;
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: CustomAppBar(
            title: 'Profile',
            leftIcon: Icons.menu,
            onTapLeft: () {
              widget.scaffoldKey.currentState!.openDrawer();
            },
          ),
          body: SafeArea(
            child: state is UserLoading
                ? SpinKitSpinningLines(
                    color: AppColors.primary,
                    size: 40.0,
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                AppImages.profilePlaceholder,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                                child: Text(
                                  'First Name',
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkGrey,
                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: _firstNameController,
                                hintText: 'First Name',
                                readOnly: true,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                                child: Text(
                                  'Last Name',
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkGrey,
                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: _lastNameController,
                                hintText: 'Last Name',
                                readOnly: true,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                                child: Text(
                                  'Email',
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkGrey,
                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                                readOnly: true,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                                child: Text(
                                  'Phone Number',
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkGrey,
                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: _phoneController,
                                hintText: 'Phone Number',
                                readOnly: true,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                                child: Text(
                                  'Mailing Address',
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkGrey,
                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: _addressController,
                                hintText: 'Mailing Address',
                                readOnly: true,
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          CustomSubmitButton(
                            text: 'Edit',
                            onPressed: () {
                              GoRouter.of(context).push('/edit-profile');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
