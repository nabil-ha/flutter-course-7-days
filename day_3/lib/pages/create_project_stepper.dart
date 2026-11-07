import 'package:day_3/models/client.dart';
import 'package:day_3/models/project.dart';
import 'package:day_3/models/user.dart';
import 'package:day_3/pages/project_page.dart';
import 'package:flutter/material.dart';

class CreateProjectStepperPage extends StatefulWidget {
  const CreateProjectStepperPage({super.key});

  @override
  State<CreateProjectStepperPage> createState() =>
      _CreateProjectStepperPageState();
}

class _CreateProjectStepperPageState extends State<CreateProjectStepperPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentStep = 0;
  String projectName = "";
  String clientCompanyName = "";
  String? clientEmail;
  String? clientCRNo;
  String? clientVATNo;
  String? clientPhoneNo;
  DateTime startDate = DateTime.now();
  ProjectStatus projectStatus = ProjectStatus.pending;
  UserRole userRole = UserRole.Admin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Project")),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              currentStep: currentStep,
              onStepContinue: () {
                // Take me to next step
                if (currentStep < 2) {
                  setState(() {
                    currentStep = currentStep + 1;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep != 0) {
                  setState(() {
                    currentStep = currentStep - 1;
                  });
                }
              },
              steps: [
                // STEP 1 Project Details
                // Project name
                Step(
                  title: Text("Project Details"),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Project Name"),
                        ),
                        onChanged: (value) {
                          projectName = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Project name can not be empty";
                          }
                          return null; // All checks are correct
                        },
                      ),
                      DropdownButtonFormField(
                        value: projectStatus,
                        items: ProjectStatus.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            projectStatus = value!;
                          });
                        },
                        isDense: true,
                      ),
                      const SizedBox(height: 30),
                      InputDatePickerFormField(
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        initialDate: startDate,
                        onDateSubmitted: (value) {
                          startDate = value;
                        },
                      ),
                    ],
                  ),
                ),
                // Partner's name
                // if (userRole == UserRole.Partner)
                //   TextFormField(
                //     decoration: InputDecoration(
                //       label: Text("Your partner code"),
                //     ),
                //   ),
                // STEP 2 : Client's Info
                // Client company name
                Step(
                  title: Text("Client's Information"),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Client's Company name"),
                        ),
                        onChanged: (value) {
                          clientCompanyName = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Client's company name can not be empty";
                          }
                          return null;
                        },
                      ),
                      // Client email
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Client Email"),
                        ),
                        onChanged: (value) {
                          clientEmail = value;
                        },
                      ),
                      // Client CR number
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Client's CR No"),
                        ),
                        onChanged: (value) {
                          clientCRNo = value;
                        },
                      ),
                      // Client vat number
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(label: Text("Client VAT")),
                        onChanged: (value) {
                          clientVATNo = value;
                        },
                      ),
                      // Client phone number
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Client's Phone No"),
                        ),
                        onChanged: (value) {
                          clientPhoneNo = value;
                        },
                      ),
                    ],
                  ),
                ),

                // STEP 3: Review & Create
                Step(
                  title: Text("Review & Create"),
                  content: Column(
                    children: [
                      Text("Project Name: $projectName"),
                      Text("Project Status: ${projectStatus.name}"),
                      Text("Start Date: ${startDate.toString().split(' ')[0]}"),
                      const SizedBox(height: 16),
                      Text("Client Company Name: $clientCompanyName"),
                      Text("Client Email: ${clientEmail ?? 'N/A'}"),
                      Text("Client CR No: ${clientCRNo ?? 'N/A'}"),
                      Text("Client VAT No: ${clientVATNo ?? 'N/A'}"),
                      Text("Client Phone No: ${clientPhoneNo ?? 'N/A'}"),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          bool isFormValid = _formKey.currentState!.validate();
                          if (isFormValid) {
                            Project project = Project(
                              name: projectName,
                              client: Client(
                                clientCompanyName: clientCompanyName,
                                clientCR: clientCRNo,
                                clientContactEmail: clientEmail,
                                clientPhoneNumber: clientPhoneNo,
                                clientVAT: clientVATNo,
                              ),
                              startDate: startDate,
                              status: projectStatus,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProjectPage(project: project),
                              ),
                            );
                          }
                        },
                        child: Text("Create"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
