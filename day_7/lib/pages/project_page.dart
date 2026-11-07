import 'dart:io';

import 'package:day_7/models/approval_documents.dart';
import 'package:day_7/models/project.dart';
import 'package:day_7/models/quotation.dart';
import 'package:day_7/models/user.dart';
import 'package:day_7/pages/create_quotation_page.dart';
import 'package:day_7/providers/project_provider.dart';
import 'package:day_7/providers/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.projectName});
  final String projectName;
  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, projectProvider, child) {
        Project project = projectProvider.getProject(widget.projectName);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Project Details"),
            elevation: 0,
            backgroundColor: Colors.blue.shade700,
          ),
          backgroundColor: Colors.grey.shade50,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildProjectHeader(project),
                _buildStatusTimeline(project),
                const SizedBox(height: 24),
                _buildProjectInfo(project),
                const SizedBox(height: 24),
                buildContent(project),
                const SizedBox(height: 24),
                if (project.quotation != null) buildQuotation(),
                if (project.approvalDocuments != null) buildApprovalDocuments(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectHeader(Project project) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.business, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  project.client.clientCompanyName,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTimeline(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...ProjectStatus.values.map((projectStatus) {
              int currentIndex = ProjectStatus.values.indexOf(projectStatus);
              int activeIndex = ProjectStatus.values.indexOf(project.status);
              bool isActive = activeIndex == currentIndex;
              bool isCompleted = activeIndex > currentIndex;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? Colors.blue.shade700
                            : (isCompleted
                                  ? Colors.green
                                  : Colors.grey.shade300),
                        boxShadow: isActive
                            ? [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 12,
                                  spreadRadius: 2,
                                ),
                              ]
                            : [],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        (currentIndex + 1).toString(),
                        style: TextStyle(
                          color: isActive || isCompleted
                              ? Colors.white
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 80),
                      child: Text(
                        projectStatus.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isActive
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isActive
                              ? Colors.blue.shade700
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectInfo(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildInfoRow(
                Icons.calendar_today,
                "Start Date",
                _formatDate(project.startDate),
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 16),
              _buildInfoRow(
                Icons.event,
                "End Date",
                _formatDate(project.endDate),
                dateColor: getEndDateColor(project.endDate),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    Color? dateColor,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.blue.shade700, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: dateColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Not set";
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Widget buildContent(Project project) {
    ProjectStatus status = project.status;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    UserRole userRole = userProvider.userRole!;

    String message = "";
    Widget? actionWidget;

    switch (status) {
      case ProjectStatus.pending:
        message = "Waiting for sales team to create a quotation";
        if (userRole == UserRole.Admin || userRole == UserRole.Sales) {
          actionWidget = buildPendingContentForAdminOrSales();
        }
        break;
      case ProjectStatus.quoted:
        message = "Awaiting client approval or rejection";
        if (userRole == UserRole.Client) {
          actionWidget = buildClientApproveRejectButtons();
        }
        break;
      case ProjectStatus.approved:
        message = "Waiting for operations team to start production";
        if (userRole == UserRole.Operation) {
          actionWidget = buildOperationsButtons(project);
        }
        break;
      case ProjectStatus.rejected:
        message = "Quotation has been rejected by client";
        break;
      case ProjectStatus.inProduction:
        message = "In production - awaiting delivery";
        if (userRole == UserRole.Operation) {
          actionWidget = buildOperationsButtons(project);
        }
        break;
      case ProjectStatus.delivered:
        message = "Project has been successfully delivered";
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.indigo.shade50, Colors.blue.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      _getStatusIcon(status),
                      color: Colors.indigo.shade700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              if (actionWidget != null) ...[
                const SizedBox(height: 20),
                actionWidget,
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getStatusIcon(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.pending:
        return Icons.schedule;
      case ProjectStatus.quoted:
        return Icons.assignment;
      case ProjectStatus.approved:
        return Icons.check_circle;
      case ProjectStatus.rejected:
        return Icons.cancel;
      case ProjectStatus.inProduction:
        return Icons.build;
      case ProjectStatus.delivered:
        return Icons.done_all;
    }
  }

  Widget buildQuotation() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    Project project = projectProvider.getProject(widget.projectName);
    Quotation quotation = project.quotation!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.amber.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.receipt, color: Colors.orange.shade700),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Quotation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildQuotationItem(
                "Price",
                "AED ${quotation.price.toString()}",
                Colors.green.shade700,
              ),
              const SizedBox(height: 12),
              _buildQuotationItem(
                "Notes",
                quotation.notes ?? "No notes provided",
                Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuotationItem(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildApprovalDocuments() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    Project project = projectProvider.getProject(widget.projectName);
    ApprovalDocuments approvalDocuments = project.approvalDocuments!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.teal.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.verified_user,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Approval Documents",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildDocumentItem(
                "Purchase Order (PO)",
                approvalDocuments.po.path.split('/').last,
                Icons.description,
                Colors.blue.shade700,
              ),
              const SizedBox(height: 12),
              _buildDocumentItem(
                "Payment Document",
                approvalDocuments.payment.path.split('/').last,
                Icons.payment,
                Colors.purple.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentItem(
    String label,
    String fileName,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                fileName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPendingContentForAdminOrSales() {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    Project project = projectProvider.getProject(widget.projectName);
    if (project.quotation == null) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreateQuotationPage(projectName: project.name),
            ),
          ),
          icon: const Icon(Icons.add_circle),
          label: const Text("Create Quotation"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget buildClientApproveRejectButtons() {
    final ProjectProvider projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    Project project = projectProvider.getProject(widget.projectName);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              File? po;
              File? payment;
              showDialog(
                context: context,
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.verified_user,
                              color: Colors.green.shade700,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Upload Approval Documents",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildFilePickerButton(
                            label: po != null
                                ? "✓ PO File Selected"
                                : "Choose Purchase Order (PO)",
                            icon: Icons.description,
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles();
                              if (result != null) {
                                setState(() {
                                  po = File(result.paths[0]!);
                                });
                              }
                            },
                            isSelected: po != null,
                          ),
                          const SizedBox(height: 12),
                          _buildFilePickerButton(
                            label: payment != null
                                ? "✓ Payment File Selected"
                                : "Choose Payment Document",
                            icon: Icons.payment,
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles();
                              if (result != null) {
                                setState(() {
                                  payment = File(result.paths[0]!);
                                });
                              }
                            },
                            isSelected: payment != null,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel"),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: po != null && payment != null
                                      ? () {
                                          projectProvider.approveQuotation(
                                            project.name,
                                            ApprovalDocuments(
                                              payment: payment!,
                                              po: po!,
                                            ),
                                          );
                                          Navigator.pop(context);
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade700,
                                    disabledBackgroundColor:
                                        Colors.grey.shade400,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Approve",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.check_circle),
            label: const Text("Approve"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => projectProvider.rejectQuotation(project.name),
            icon: const Icon(Icons.cancel),
            label: const Text("Reject"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilePickerButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isSelected,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.blue.shade700
              : Colors.grey.shade200,
          foregroundColor: isSelected ? Colors.white : Colors.grey.shade700,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget buildOperationsButtons(Project project) {
    final projectProvider = Provider.of<ProjectProvider>(
      context,
      listen: false,
    );
    ProjectStatus projectStatus = project.status;

    return SizedBox(
      width: double.infinity,
      child: projectStatus == ProjectStatus.approved
          ? ElevatedButton.icon(
              onPressed: () {
                projectProvider.moveToProduction(project.name);
              },
              icon: const Icon(Icons.build),
              label: const Text("Move to Production"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade700,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: () {
                projectProvider.markAsDelivered(project.name);
              },
              icon: const Icon(Icons.local_shipping),
              label: const Text("Mark as Delivered"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
    );
  }

  Color getEndDateColor(DateTime? endDate) {
    if (endDate == null) {
      return Colors.purple;
    }
    DateTime today = DateTime.now();
    if (endDate.isAfter(today)) {
      return Colors.green.shade900;
    } else {
      return Colors.red;
    }
  }
}
