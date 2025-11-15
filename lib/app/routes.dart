import 'package:flutter/material.dart';
import '../features/gravity_feed/gravity_feed_screen.dart';

class AppRoutes {
  static const String gravityFeed = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gravityFeed:
      default:
        return MaterialPageRoute(
          builder: (_) => const GravityFeedScreen(),
          settings: settings,
        );
    }
  }
}
