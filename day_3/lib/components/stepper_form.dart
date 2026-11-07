import 'package:flutter/material.dart';

class StepperFormExample extends StatefulWidget {
  const StepperFormExample({super.key});

  @override
  State<StepperFormExample> createState() => _StepperFormExampleState();
}

class _StepperFormExampleState extends State<StepperFormExample> {
  int _currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingControllers for each step
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Function to handle "Continue" button press
  void _continue() {
    // Validate only the current step
    bool isValid = false;

    if (_currentStep == 0) {
      isValid = _nameController.text.isNotEmpty;
    } else if (_currentStep == 1) {
      isValid = _addressController.text.isNotEmpty;
    } else {
      isValid = true; // Step 2 has no validation
    }

    if (isValid) {
      if (_currentStep < 2) {
        setState(() {
          _currentStep += 1;
        });
      }
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _currentStep == 0
                ? 'Please enter your name'
                : 'Please enter your address',
          ),
        ),
      );
    }
  }

  // Function to handle "Cancel" button press
  void _cancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Function to handle step taps
  void _tap(int index) {
    setState(() {
      _currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form with Stepper')),
      body: Form(
        // Wrap the stepper in a Form widget for validation
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical, // or StepperType.horizontal
          currentStep: _currentStep,
          onStepContinue: _continue,
          onStepCancel: _cancel,
          onStepTapped: _tap,
          steps: [
            Step(
              title: const Text('Personal Info'),
              content: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Billing Address'),
              content: TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Payment Details'),
              content: const Text('Payment form fields go here...'),
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }
}
