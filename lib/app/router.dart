import 'package:flutter/material.dart';

import '../features/home/screens/home_screen.dart';

class AppRouter {
  AppRouter._();

  // Route names
  static const String home = '/';
  static const String newTest = '/new-test';
  static const String history = '/history';
  static const String analytics = '/analytics';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),

        // Temporary placeholders.
        // These will be replaced with real feature screens
        // as we build each part of the application.
        newTest: (context) => const _PlaceholderScreen(
              title: 'New Test',
            ),
        history: (context) => const _PlaceholderScreen(
              title: 'History',
            ),
        analytics: (context) => const _PlaceholderScreen(
              title: 'Analytics',
            ),
        settings: (context) => const _PlaceholderScreen(
              title: 'Settings',
            ),
    };
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}