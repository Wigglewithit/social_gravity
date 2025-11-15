import 'package:flutter/material.dart';
import 'routes.dart';
import '../core/theme/app_theme.dart';

class SocialGravityApp extends StatelessWidget {
  const SocialGravityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Gravity',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.gravityFeed,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
