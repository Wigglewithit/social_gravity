import 'package:flutter/material.dart';
import '../features/gravity_feed/presentation/pages/gravity_feed_page.dart';

class AppRoutes {
  static const String gravityFeed = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gravityFeed:
      default:
        return MaterialPageRoute(
          builder: (_) => const GravityFeedPage(),
          settings: settings,
        );
    }
  }
}
