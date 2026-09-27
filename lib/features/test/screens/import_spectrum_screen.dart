import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_dimensions.dart';
import '../../../models/food_sample.dart';

class ImportSpectrumScreen extends StatefulWidget {
  final FoodSample foodSample;

  const ImportSpectrumScreen({
    super.key,
    required this.foodSample,
  });

  @override
  State<ImportSpectrumScreen> createState() =>
      _ImportSpectrumScreenState();
}

class _ImportSpectrumScreenState
    extends State<ImportSpectrumScreen> {
  String? selectedFileName;

  Future<void> _pickSpectrumFile() async {
    final files = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'csv',
        'json',
        'txt',
      ],
    );

    if (files.isEmpty) {
      return;
    }

    setState(() {
      selectedFileName = files.first.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Spectrum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.pagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),

            Text(
              'Sample: ${widget.foodSample.name}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Import an existing spectrum file for analysis.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            const Icon(
              Icons.upload_file,
              size: 64,
            ),

            const SizedBox(height: 32),

            if (selectedFileName != null) ...[
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.description,
                  ),
                  title: const Text(
                    'Selected file',
                  ),
                  subtitle: Text(
                    selectedFileName!,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],

            ElevatedButton.icon(
              onPressed: _pickSpectrumFile,
              icon: const Icon(
                Icons.folder_open,
              ),
              label: Text(
                selectedFileName == null
                    ? 'Choose Spectrum File'
                    : 'Choose Another File',
              ),
            ),
          ],
        ),
      ),
    );
  }
}