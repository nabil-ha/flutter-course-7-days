import 'dart:io';
import 'package:day_5/providers/project_provider.dart';
import 'package:day_5/providers/document_provider.dart';
import 'package:day_5/models/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  // ---- Day 6, Bullet Point 3: Status-based UI rendering ----
  Widget buildStatusSection(Project project) {
    switch (project.status) {
      case ProjectStatus.created:
        return const Text("Waiting for Sales quotation");

      case ProjectStatus.quoted:
        return const Text("Quotation sent to client");

      case ProjectStatus.approved:
        return const Text("Approved! Ready for production");

      case ProjectStatus.inProduction:
        return const Text("Manufacturing in progress");

      case ProjectStatus.readyForDelivery:
        return const Text("Ready for delivery");

      case ProjectStatus.completed:
        return const Text("Project completed");

      default:
        return const SizedBox.shrink();
    }
  }
  // ---- End Day 6 ----

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, projectProvider, child) => Scaffold(
        appBar: AppBar(title: Text("Project")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: " + projectProvider.project!.name),
                    Text(
                      "Company Name: " +
                          projectProvider.project!.client.clientCompanyName,
                    ),
                    Text(
                      "Project Status: " + projectProvider.project!.status.name,
                    ),
                    const SizedBox(height: 16),
                    // ---- Day 6, Bullet Point 3: Status section display ----
                    buildStatusSection(projectProvider.project!),
                    // ---- End Day 6 ----
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              // ---- Day 6, Bullet Point 9: Delivery reminder ----
              if (projectProvider.shouldShowDeliveryReminder(
                projectProvider.project!,
              ))
                Card(
                  color: Colors.orange,
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Delivery is approaching"),
                  ),
                ),
              // ---- End Day 6 ----
              Text('Documents', style: Theme.of(context).textTheme.titleLarge),
              Consumer<DocumentProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await value.pickAndUploadDocuments();
                      },
                      child: Text("Add Documents"),
                    ),
                    // ---- Day 6, Bullet Point 6: Upload PO button ----
                    ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          await value.uploadPoDocument(
                            projectProvider.project!,
                            File(result.files.single.path!),
                          );
                        }
                      },
                      child: Text("Upload PO"),
                    ),
                    // ---- End Day 6 ----
                    if (value.isUploading) CircularProgressIndicator(),
                    Text(
                      'Uploaded Documents',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    ListView.builder(
                      itemCount: value.documents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          tileColor: Colors.grey,
                          trailing: IconButton(
                            onPressed: () {
                              value.deleteDocument(
                                value.documents[index]!.location!,
                              );
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                          title: Text(
                            value.documents[index]!.originalName ?? "",
                          ),
                          subtitle: Text(
                            value.documents[index]!.location ?? "",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
