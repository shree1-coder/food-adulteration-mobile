import 'package:flutter/material.dart';
import '../../../app/theme/app_dimensions.dart';


class StartTestCard extends StatelessWidget {
  const StartTestCard({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.science_outlined,
              size: 40,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: AppDimensions.mediumSpacing),
            Text(
              'Start a New Test',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppDimensions.smallSpacing),
            Text(
              'Capture or import a spectrum to analyze your food sample.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.cardPadding),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Start Test'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}