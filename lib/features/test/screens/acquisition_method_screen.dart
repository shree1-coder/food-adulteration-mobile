import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../../../models/acquisition_method.dart';
import '../../../models/food_sample.dart';

class AcquisitionMethodScreen extends StatelessWidget {
  const AcquisitionMethodScreen({
    super.key,
    required this.foodSample,
  });

  final FoodSample foodSample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acquisition Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sample: ${foodSample.name}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose how the spectrum will be acquired.',
            ),
            const SizedBox(height: 24),
            _MethodCard(
              icon: Icons.sensors_outlined,
              title: 'Spectrometer',
              subtitle: 'Use a compatible spectrometer device.',
              method: AcquisitionMethod.spectrometer,
              onTap: () {
                // Spectrometer flow will be connected later.
              },
            ),
            const SizedBox(height: 12),
            _MethodCard(
              icon: Icons.camera_alt_outlined,
              title: 'Camera',
              subtitle: 'Capture data using the phone camera.',
              method: AcquisitionMethod.camera,
              onTap: () {
                // Camera flow will be connected later.
              },
            ),
            const SizedBox(height: 12),
            _MethodCard(
              icon: Icons.upload_file_outlined,
              title: 'Import Spectrum',
              subtitle: 'Import an existing spectrum file.',
              method: AcquisitionMethod.import,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.importSpectrum,
                  arguments: foodSample,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.method,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final AcquisitionMethod method;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}