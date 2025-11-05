import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_step_app_flutter/screens/HomeDashboardScreen.dart';
import 'package:one_step_app_flutter/screens/login_screen.dart';
import 'package:one_step_app_flutter/screens/register_login_selection.dart';
import 'package:one_step_app_flutter/screens/register_screen.dart';
import 'package:one_step_app_flutter/screens/goal_details_screen.dart';

void main() {
  runApp(const OneStepApp());
}

class OneStepApp extends StatelessWidget {
  const OneStepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'One Step - Track Your Goals',
      theme: ThemeData(
        primaryColor: const Color(0xff1d2528),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffd9f316),
          brightness: Brightness.light,
        ),
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AuthSelectionScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomeDashboardScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/goals/:goalId',
      name: 'goal-details',
      pageBuilder: (context, state) {
        final goalId = state.pathParameters['goalId']!;
        final goalTitle = state.uri.queryParameters['title'] ?? 'Goal';
        final goalDescription = state.uri.queryParameters['description'] ?? '';

        return CustomTransitionPage(
          key: state.pageKey,
          child: GoalDetailsScreen(
            goalId: goalId,
            goalTitle: goalTitle,
            goalDescription: goalDescription,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
);
