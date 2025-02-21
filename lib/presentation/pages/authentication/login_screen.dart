import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_icons.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/core/utils/validation.dart';
import 'package:app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:app/presentation/widgets/common/custom_password_field.dart';
import 'package:app/presentation/widgets/common/custom_submit_button.dart';
import 'package:app/presentation/widgets/common/custom_text_field.dart';
import 'package:app/presentation/widgets/common/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/user_bloc/user_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(state.message),
          );
        } else if (state is Authenticated) {
          context.read<UserBloc>().add(GetUser());
          _emailController.clear();
          _passwordController.clear();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is AuthLoading
              ? SpinKitSpinningLines(
                  color: AppColors.primary,
                  size: 40.0,
                )
              : BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserError) {
                      if (state.message == 'User data not found') {
                        GoRouter.of(context).push('/initial-login-image');
                      }
                    }
                    if (state is UserLoaded) {
                      GoRouter.of(context).push('/dashboard');
                    }
                  },
                  child: state is UserLoading
                      ? SpinKitSpinningLines(
                          color: AppColors.primary,
                          size: 40.0,
                        )
                      : SafeArea(
                          child: CustomScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Welcome',
                                          style: GoogleFonts.inter(
                                            color: AppColors.darkGrey,
                                            fontSize: ScreenSize.textScaleFactor(context, 32),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Welcome to your Portal',
                                          style: GoogleFonts.inter(
                                            color: AppColors.lightGrey,
                                            fontSize: ScreenSize.textScaleFactor(context, 14),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                                prefixIcon: Icons.email_outlined,
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
                                                  'Password',
                                                  style: GoogleFonts.inter(
                                                    color: AppColors.darkGrey,
                                                    fontSize: ScreenSize.textScaleFactor(context, 13),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              CustomPasswordField(
                                                controller: _passwordController,
                                                hintText: 'Password',
                                                validate: true,
                                                prefixIcon: Icons.lock_outline,
                                                onValidate: (value) {
                                                  if (!ValidationUtils.isValidPassword(value!)) {
                                                    return 'Password must be at least 3 characters long and contain at least one uppercase letter, one lowercase letter, and one number.';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Restore password',
                                                style: GoogleFonts.inter(
                                                  color: AppColors.primary,
                                                  fontSize: ScreenSize.textScaleFactor(context, 14),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Image.asset(
                                                AppIcons.upArrow,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        CustomSubmitButton(
                                          text: 'Login',
                                          suffixIcon: Icons.arrow_forward,
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              context.read<AuthBloc>().add(
                                                    LoginUserEvent(
                                                      email: _emailController.text,
                                                      password: _passwordController.text,
                                                    ),
                                                  );
                                            }
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        CustomSubmitButton(
                                          text: 'Sign Up',
                                          suffixIcon: Icons.arrow_forward,
                                          onPressed: () {
                                            GoRouter.of(context).push('/signup');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
        );
      },
    );
  }
}
