import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class FoodAdulterationApp extends StatelessWidget {
  const FoodAdulterationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodGuard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRouter.home,
      routes: AppRouter.routes,
    );
  }
}