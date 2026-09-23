import 'package:flutter/material.dart';

import '../../../app/theme/app_dimensions.dart';
import '../widgets/start_test_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodGuard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food Adulteration Detection',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppDimensions.smallSpacing),
              Text(
                'Analyze food samples and detect possible adulteration.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppDimensions.sectionSpacing),

              StartTestCard(
                onPressed: () {
                  // Navigation will be connected here.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}