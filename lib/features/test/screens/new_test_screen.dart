import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../../../app/theme/app_dimensions.dart';
import '../../../data/local/food_catalog.dart';
import '../../../models/food_sample.dart';

class NewTestScreen extends StatefulWidget {
  const NewTestScreen({super.key});

  @override
  State<NewTestScreen> createState() => _NewTestScreenState();
}

class _NewTestScreenState extends State<NewTestScreen> {
  FoodSample? selectedFood;

  @override
  Widget build(BuildContext context) {
    final samples = FoodCatalog.samples;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Test'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.pagePadding),
        itemCount: samples.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppDimensions.listSpacing),
        itemBuilder: (context, index) {
          final sample = samples[index];
          final isSelected = selectedFood?.id == sample.id;

          return Card(
            color: isSelected
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.surface,
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedFood = sample;
                });
              },
              title: Text(sample.name),
              subtitle: Text(sample.category),
              trailing: Icon(
                isSelected
                    ? Icons.check_circle
                    : Icons.chevron_right,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          child: FilledButton(
            onPressed: selectedFood == null
                ? null
                : () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.acquisitionMethod,
                      arguments: selectedFood,
                    );
                  },
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}