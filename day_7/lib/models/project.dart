import 'package:day_7/models/approval_documents.dart';
import 'package:day_7/models/quotation.dart';

import 'client.dart';

enum ProjectStatus {
  pending,
  quoted,
  approved,
  rejected,
  inProduction,
  delivered,
}

class Project {
  String name;
  String? rejectionReason;
  Client client;
  ProjectStatus status;
  List<String>? requirements;
  DateTime startDate;
  DateTime? endDate;
  Quotation? quotation;
  ApprovalDocuments? approvalDocuments;
  Project({
    required this.name,
    required this.client,
    required this.status,
    required this.startDate,
    this.endDate,
    this.quotation,
    this.approvalDocuments,
    this.requirements,
    this.rejectionReason,
  });
}
