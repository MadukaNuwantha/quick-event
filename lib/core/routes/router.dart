import 'package:app/presentation/pages/user/edit_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/authentication/login_screen.dart';
import '../../presentation/pages/authentication/signup_screen.dart';
import '../../presentation/pages/authentication/splash_screen.dart';
import '../../presentation/pages/dashboard/dashboard_screen.dart';
import '../../presentation/pages/posts/posts_screen.dart';
import '../../presentation/pages/posts/view_post_screen.dart';
import '../../presentation/pages/user/initial_login_detail_screen.dart';
import '../../presentation/pages/user/initial_login_image_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  refreshListenable: AuthStateListener(),
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
      redirect: authGuard,
    ),
    GoRoute(
      path: '/initial-login-detail',
      builder: (context, state) => const InitialLoginDetailScreen(),
      redirect: authGuard,
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
      redirect: authGuard,
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
      redirect: authGuard,
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) => const PostsScreen(),
      redirect: authGuard,
    ),
    GoRoute(
      path: '/view-post',
      builder: (context, state) => const ViewPostScreen(),
      redirect: authGuard,
    ),
  ],
);

String? authGuard(BuildContext context, GoRouterState state) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return '/login';
  }
  return null;
}

class AuthStateListener extends ChangeNotifier {
  AuthStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      notifyListeners();
    });
  }
}
