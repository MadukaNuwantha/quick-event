import 'package:app/core/constants/app_colors.dart';
import 'package:app/core/constants/app_icons.dart';
import 'package:app/core/constants/app_sizes.dart';
import 'package:app/presentation/widgets/custom_password_field.dart';
import 'package:app/presentation/widgets/custom_submit_button.dart';
import 'package:app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: SafeArea(
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
                          _formKey.currentState!.validate();
                          GoRouter.of(context).push('/initial-login-image');
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
    );
  }
}
