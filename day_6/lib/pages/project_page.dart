import 'dart:io';

import 'package:day_6/models/approval_documents.dart';
import 'package:day_6/models/project.dart';
import 'package:day_6/models/quotation.dart';
import 'package:day_6/models/user.dart';
import 'package:day_6/pages/create_quotation_page.dart';
import 'package:day_6/providers/project_provider.dart';
import 'package:day_6/providers/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
                      "Start date ${projectProvider.project!.startDate.toString()}",
                    ),
                    Text(
                      "End Date ${projectProvider.project!.endDate.toString()}",
                      style: TextStyle(
                        color: getEndDateColor(
                          projectProvider.project!.endDate,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...ProjectStatus.values
                        .map(
                          (projectStatus) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  (ProjectStatus.values.indexOf(projectStatus) +
                                          1)
                                      .toString(),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        projectProvider.project!.status ==
                                            projectStatus
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Center(
                                    child: Text(projectStatus.name),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildContent(projectProvider.project!.status),
              const SizedBox(height: 30),
              if (projectProvider.project!.quotation != null) buildQuotation(),
              if (projectProvider.project!.approvalDocuments != null)
                buildApprovalDocuments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(ProjectStatus status) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    UserRole userRole = userProvider.userRole!;
    switch (status) {
      case ProjectStatus.pending:
        return Column(
          children: [
            Text("Waiting for sales"),
            if (userRole == UserRole.Admin || userRole == UserRole.Sales)
              buildPendingContentForAdminOrSales(),
          ],
        );
      case ProjectStatus.quoted:
        return Column(
          children: [
            Text("Waiting for client to approve or reject"),
            if (userRole == UserRole.Client) buildClientApproveRejectButtons(),
          ],
        );
      case ProjectStatus.approved:
        return Column(
          children: [
            Text("Waiting for operations team"),
            if (userRole == UserRole.Operation) buildOperationsButtons(),
          ],
        );
      case ProjectStatus.rejected:
        return Text("quotation has been rejected");
      case ProjectStatus.inProduction:
        return Column(
          children: [
            Text("Waiting for production to finish and delivery"),
            if (userRole == UserRole.Operation) buildOperationsButtons(),
          ],
        );
      case ProjectStatus.delivered:
        return Text("Project has been delivered");
      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildQuotation() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    Quotation quotation = projectProvider.project!.quotation!;
    return ListTile(
      title: Text("Quotation"),
      subtitle: Column(
        children: [
          Text("Price: ${quotation.price}"),
          Text("Notes: ${quotation.notes}"),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.document_scanner),
      ),
    );
  }

  Widget buildApprovalDocuments() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    ApprovalDocuments approvalDocuments =
        projectProvider.project!.approvalDocuments!;
    return ListTile(
      title: Text("Approval Documents"),
      subtitle: Column(
        children: [
          Text("PO: ${approvalDocuments.po}"),
          Text("Payment: ${approvalDocuments.payment}"),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.document_scanner),
      ),
    );
  }

  Widget buildPendingContentForAdminOrSales() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    if (projectProvider.project!.quotation == null) {
      return ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateQuotationPage()),
        ),
        child: Text("Create Quotation"),
      );
    }
    return const SizedBox.shrink();
  }

  Widget buildClientApproveRejectButtons() {
    final ProjectProvider projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            File? po;
            File? payment;
            showDialog(
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, setState) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles();
                            if (result != null) {
                              setState(() {
                                po = File(result.paths[0]!);
                              });
                            }
                          },
                          child: Text(
                            po != null
                                ? "PO File has been chosen"
                                : "Choose Purchase Order (PO)",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles();
                            if (result != null) {
                              setState(() {
                                payment = File(result.paths[0]!);
                              });
                            }
                          },
                          child: Text(
                            payment != null
                                ? "Payment File has been chosen"
                                : "Choose Payment",
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            if (po != null && payment != null) {
                              projectProvider.approveQuotation(
                                ApprovalDocuments(payment: payment!, po: po!),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Approve now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Text("Approve"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => projectProvider.rejectQuotation(),
          child: Text("Reject"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
      ],
    );
  }

  Widget buildOperationsButtons() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    ProjectStatus projectStatus = projectProvider.project!.status;

    return projectStatus == ProjectStatus.approved
        ? ElevatedButton(
            onPressed: () {
              projectProvider.moveToProduction();
            },
            child: Text("Move to production"),
          )
        : ElevatedButton(
            onPressed: () {
              projectProvider.markAsDelivered();
            },
            child: Text("Delivery has been made"),
          );
  }

  Color getEndDateColor(DateTime? endDate) {
    if (endDate == null) {
      return Colors.purple;
    }
    DateTime today = DateTime.now();
    if (endDate.isAfter(today)) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
