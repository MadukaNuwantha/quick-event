import 'package:app/presentation/pages/dashboard_screen.dart';
import 'package:app/presentation/pages/edit_profile_screen.dart';
import 'package:app/presentation/pages/initial_login_detail_screen.dart';
import 'package:app/presentation/pages/initial_login_image_screen.dart';
import 'package:app/presentation/pages/signup_screen.dart';
import 'package:app/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/initial-login-image',
      builder: (context, state) => const InitialLoginImageScreen(),
    ),
    GoRoute(
      path: '/initial-login-detail',
      builder: (context, state) => const InitialLoginDetailScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);
