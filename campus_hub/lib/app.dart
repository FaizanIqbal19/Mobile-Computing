import 'package:flutter/material.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'feature/home/data/in_memory_task_repository.dart';
import 'feature/home/presentation/explore_screen.dart';
import 'feature/home/presentation/home_screen.dart';
import 'feature/profile/profile_screen.dart';
import 'feature/showcase/ui_showcase_screen.dart';
import 'feature/splash/splash_screen.dart';

class CampusHubApp extends StatelessWidget {
  CampusHubApp({super.key});

  static const homeRoute = AppRoutes.home;
  static const exploreRoute = AppRoutes.explore;
  static const profileRoute = AppRoutes.profile;
  static const showcaseRoute = AppRoutes.showcase;
  final InMemoryTaskRepository _taskRepository = InMemoryTaskRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Hub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashScreen(),
      routes: {
        homeRoute: (_) => HomeScreen(repository: _taskRepository),
        exploreRoute: (_) => const ExploreScreen(),
        profileRoute: (_) => const ProfileScreen(),
        showcaseRoute: (_) => const UiShowcaseScreen(),
      },
    );
  }
}
