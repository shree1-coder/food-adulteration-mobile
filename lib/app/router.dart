import 'package:flutter/material.dart';

import '../features/home/screens/home_screen.dart';
import '../features/test/screens/acquisition_method_screen.dart';
import '../features/test/screens/import_spectrum_screen.dart';
import '../features/test/screens/new_test_screen.dart';
import '../models/food_sample.dart';

class AppRouter {
  AppRouter._();

  // Route names
  static const String home = '/';
  static const String newTest = '/new-test';
  static const String acquisitionMethod = '/acquisition-method';
  static const String importSpectrum = '/import-spectrum';
  static const String history = '/history';
  static const String analytics = '/analytics';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),

        newTest: (context) => const NewTestScreen(),

        acquisitionMethod: (context) {
          final foodSample =
              ModalRoute.of(context)!.settings.arguments as FoodSample;

          return AcquisitionMethodScreen(
            foodSample: foodSample,
          );
        },

        importSpectrum: (context) {
          final foodSample =
              ModalRoute.of(context)!.settings.arguments as FoodSample;

          return ImportSpectrumScreen(
            foodSample: foodSample,
          );
        },

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