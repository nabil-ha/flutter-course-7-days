import 'package:day_6/models/client.dart';
import 'package:day_6/models/project.dart';
import 'package:day_6/models/user.dart';
import 'package:day_6/pages/project_page.dart';
import 'package:day_6/providers/document_provider.dart';
import 'package:day_6/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  // ProjectStatus projectStatus = ProjectStatus.pending;
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
                // Step 0: Project information
                // Step 1: Client information
                // Step 3: Review & Create
                if (currentStep == 0) {
                  if (projectName.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Project name cant be empty",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    );
                    return;
                  }
                }
                // Take me to next step
                if (currentStep < 3) {
                  setState(() {
                    currentStep = currentStep + 1;
                  });
                } else if (currentStep == 3) {
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
                      endDate: endDate,
                      status: ProjectStatus.pending,
                    );
                    Provider.of<ProjectProvider>(
                      context,
                      listen: false,
                    ).addProject(project);
                    // Return to dashboard instead of going to project page
                    Navigator.pop(context);
                  }
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
                        // This is checked when .validate() is called
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Project name can not be empty";
                          }
                          return null; // All checks are correct
                        },
                      ),
                      // DropdownButtonFormField(
                      //   value: projectStatus,
                      //   items: ProjectStatus.values
                      //       .map(
                      //         (e) => DropdownMenuItem(
                      //           value: e,
                      //           child: Text(e.name),
                      //         ),
                      //       )
                      //       .toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       projectStatus = value!;
                      //     });
                      //   },
                      //   isDense: true,
                      // ),
                      const SizedBox(height: 30),
                      InputDatePickerFormField(
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        initialDate: startDate,
                        fieldLabelText: 'Start Date',
                        onDateSubmitted: (value) {
                          startDate = value;
                          print('submitted ${value}');
                        },
                      ),
                      const SizedBox(height: 20),
                      InputDatePickerFormField(
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        initialDate: endDate,
                        fieldLabelText: 'End Date',
                        onDateSubmitted: (value) {
                          endDate = value;
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

                Step(
                  title: Text("Uplaod documents"),
                  content: Consumer<DocumentProvider>(
                    builder: (context, value, child) => Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await value.pickAndUploadDocuments();
                          },
                          child: Text("Add Documents"),
                        ),
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
                ),
                // STEP 4: Review & Create
                Step(
                  title: Text("Review & Create"),
                  content: Column(
                    children: [
                      Text("Project Name: $projectName"),
                      Text("Project Status: ${ProjectStatus.pending}"),
                      Text("Start Date: ${startDate.toString().split(' ')[0]}"),
                      const SizedBox(height: 16),
                      Text("Client Company Name: $clientCompanyName"),
                      Text("Client Email: ${clientEmail ?? 'N/A'}"),
                      Text("Client CR No: ${clientCRNo ?? 'N/A'}"),
                      Text("Client VAT No: ${clientVATNo ?? 'N/A'}"),
                      Text("Client Phone No: ${clientPhoneNo ?? 'N/A'}"),
                      const SizedBox(height: 24),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     bool isFormValid = _formKey.currentState!.validate();
                      //     if (isFormValid) {
                      //       Project project = Project(
                      //         name: projectName,
                      //         client: Client(
                      //           clientCompanyName: clientCompanyName,
                      //           clientCR: clientCRNo,
                      //           clientContactEmail: clientEmail,
                      //           clientPhoneNumber: clientPhoneNo,
                      //           clientVAT: clientVATNo,
                      //         ),
                      //         startDate: startDate,
                      //         status: projectStatus,
                      //       );
                      //       Provider.of<ProjectProvider>(
                      //         context,
                      //         listen: false,
                      //       ).setProject(project);
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => ProjectPage(),
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: Text("Create"),
                      // ),
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
