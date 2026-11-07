import 'package:day_5/models/project.dart';
import 'package:day_5/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ---- Day 6, Bullet Point 4: Sales quotation submission flow ----
class SalesActionsPanel extends StatefulWidget {
  final Project project;

  const SalesActionsPanel({super.key, required this.project});

  @override
  State<SalesActionsPanel> createState() => _SalesActionsPanelState();
}

class _SalesActionsPanelState extends State<SalesActionsPanel> {
  final _priceController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Price"),
          ),
          SizedBox(height: 8),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(labelText: "Notes"),
            maxLines: 3,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final provider = context.read<ProjectProvider>();

              provider.submitQuotation(
                widget.project,
                price: double.parse(_priceController.text),
                notes: _notesController.text,
              );

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Quotation submitted")));
            },
            child: const Text("Submit Quotation"),
          ),
        ],
      ),
    );
  }
}

// ---- End Day 6 ----
