import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/custom_submit_button.dart';
import 'package:app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialLoginDetailScreen extends StatefulWidget {
  const InitialLoginDetailScreen({super.key});

  @override
  State<InitialLoginDetailScreen> createState() => _InitialLoginDetailScreenState();
}

class _InitialLoginDetailScreenState extends State<InitialLoginDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Info',
                      style: GoogleFonts.inter(
                        color: AppColors.darkGrey,
                        fontSize: ScreenSize.textScaleFactor(context, 18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You can add your personal data now or do it later',
                      style: GoogleFonts.inter(
                        color: AppColors.lightGrey,
                        fontSize: ScreenSize.textScaleFactor(context, 13),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
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
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSubmitButton(
                            text: 'Back',
                            prefixIcon: Icons.arrow_back,
                            backgroundColor: AppColors.lightPrimary,
                            foregroundColor: AppColors.darkGrey,
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomSubmitButton(
                            text: 'Next',
                            suffixIcon: Icons.arrow_forward,
                            onPressed: () {
                              GoRouter.of(context).push('/dashboard');
                            },
                          ),
                        ),
                      ],
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
