import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:app/presentation/widgets/custom_submit_button.dart';
import 'package:app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        leftIcon: Icons.arrow_back,
        onTapLeft: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              AppImages.profilePlaceholder,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
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
                          validate: true,
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
                          validate: true,
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
                          validate: true,
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
                          validate: true,
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
                          validate: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Spacer(),
                    CustomSubmitButton(
                      text: 'Save',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
