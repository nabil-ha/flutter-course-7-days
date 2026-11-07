import 'dart:io';

import 'package:day_6/models/quotation.dart';
import 'package:day_6/providers/project_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQuotationPage extends StatefulWidget {
  const CreateQuotationPage({super.key});

  @override
  State<CreateQuotationPage> createState() => _CreateQuotationPageState();
}

class _CreateQuotationPageState extends State<CreateQuotationPage> {
  double price = 0;
  String notes = "";
  File? attachment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Quotation Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Price"),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) {
                price = double.parse(value);
              },
            ),
            Text("Notes"),
            TextField(
              onChanged: (value) {
                notes = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles();
                if (result != null) {
                  setState(() {
                    attachment = File(result.paths[0]!);
                  });
                }
              },
              child: Text(
                attachment != null ? "File has been chosen" : "Choose document",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final projectProvider = Provider.of<ProjectProvider>(
                  context,
                  listen: false,
                );
                if (attachment != null) {
                  projectProvider.createQuotation(
                    Quotation(
                      price: price,
                      attachment: attachment!,
                      notes: notes,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
