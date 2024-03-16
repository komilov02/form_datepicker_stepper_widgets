import 'package:flutter/material.dart';

class StepperHorizontalExampleScreen extends StatefulWidget {
  const StepperHorizontalExampleScreen({super.key});

  @override
  State<StepperHorizontalExampleScreen> createState() => _StepperHorizontalExampleScreenState();
}

class _StepperHorizontalExampleScreenState extends State<StepperHorizontalExampleScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  late final List _textFieldKeys;

  late final List<GlobalKey<FormState>> _stepFormKeys;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  int _currentStep = 0;
  bool _isChecked = false;

  @override
  void initState() {
    _stepFormKeys = [formKey1, formKey2, formKey3];
    _textFieldKeys = [_nameKey, _emailKey, _passwordKey];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Step>  steps = [
      Step(
        title: Text("Start"),
        subtitle: Text("subtitle"),
        isActive: true,
        state: _currentStep ==0 ? StepState.editing: _currentStep > 0? StepState.complete :StepState.indexed,
        content: const  Text("Content 1 "),
      ),
      Step(
        title: Text("Email"),
        subtitle: Text("subtitle"),
        isActive: true,
        state: _currentStep ==1 ? StepState.editing: _currentStep > 1? StepState.complete :StepState.indexed,
        content:  const  Text("Content 2 "),
      ),
      Step(
        title: Text("Parol"),
        subtitle: Text("subtitle"),
        isActive: true,
        state: _currentStep ==2 ? StepState.editing: _currentStep > 2 ? StepState.complete :StepState.indexed,
        content:  const  Text("Content 3 "),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper index boyicha"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 500.0),
                child: Stepper(
                  type: StepperType.horizontal,
                  steps: steps,
                  currentStep: _currentStep,
                  onStepTapped: (step) {
                      setState(() {
                        _currentStep = step;
                      });
                  },
                  onStepContinue: () {
                      setState(() {
                        if (_currentStep != (steps.length - 1)) {
                          _currentStep += 1;
                        } else if (_currentStep == steps.length - 1) {
              
                          print("Steplar tugadi bosh sahifaga hush kelibsiz");
                        }
                      });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_currentStep != 0) {
                        _currentStep -= 1;
                      }
                    });
                  },
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}



