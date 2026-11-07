import 'dart:io';
import 'package:day_5/models/project.dart';
import 'package:day_5/providers/document_provider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

// ---- Day 6, Bullet Point 6: PO & payment receipt handling ----
class ClientPoSection extends StatelessWidget {
  final Project project;

  const ClientPoSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () async {
          final file = await FilePicker.platform.pickFiles();

          if (file != null) {
            await context.read<DocumentProvider>().uploadPoDocument(
              project,
              File(file.files.single.path!),
            );

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("PO uploaded successfully")),
              );
            }
          }
        },
        child: const Text("Upload PO"),
      ),
    );
  }
}

// ---- End Day 6 ----
