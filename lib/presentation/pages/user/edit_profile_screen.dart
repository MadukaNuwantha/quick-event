import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_images.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/core/utils/validation.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:app/presentation/widgets/common/custom_appbar.dart';
import 'package:app/presentation/widgets/common/custom_submit_button.dart';
import 'package:app/presentation/widgets/common/custom_text_field.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        leftIcon: Icons.arrow_back,
        onTapLeft: () {
          GoRouter.of(context).pop();
        },
      ),
      body: BlocConsumer<UserBloc, UserState>(
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
          if (state is UserSaved) {
            _firstNameController.clear();
            _lastNameController.clear();
            _emailController.clear();
            _phoneController.clear();
            _addressController.clear();
            context.read<UserBloc>().add(GetUser());
            GoRouter.of(context).pushReplacement('/dashboard');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: state is UserLoading
                ? SpinKitSpinningLines(
                    color: AppColors.primary,
                    size: 40.0,
                  )
                : CustomScrollView(
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
                                      onValidate: (value) {
                                        if (!ValidationUtils.isValidName(value!)) {
                                          return 'Invalid first name (3-10 letters)';
                                        }
                                        return null;
                                      },
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
                                      onValidate: (value) {
                                        if (!ValidationUtils.isValidName(value!)) {
                                          return 'Invalid last name (3-10 letters)';
                                        }
                                        return null;
                                      },
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
                                      onValidate: (value) {
                                        if (!ValidationUtils.isValidEmail(value!)) {
                                          return 'Invalid email address';
                                        }
                                        return null;
                                      },
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
                                      onValidate: (value) {
                                        if (!ValidationUtils.isValidPhoneNumber(value!)) {
                                          return 'Invalid Sri Lankan phone number';
                                        }
                                        return null;
                                      },
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
                                      onValidate: (value) {
                                        if (!ValidationUtils.isValidAddress(value!)) {
                                          return 'Address must be between 6 and 50 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Spacer(),
                              CustomSubmitButton(
                                text: 'Save',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<UserBloc>().add(
                                          SaveUser(
                                            firstName: _firstNameController.text,
                                            lastName: _lastNameController.text,
                                            email: _emailController.text,
                                            phoneNumber: _phoneController.text,
                                            address: _addressController.text,
                                          ),
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
