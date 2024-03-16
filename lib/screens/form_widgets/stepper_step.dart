import 'package:flutter/material.dart';

class StepperExampleScreen extends StatefulWidget {
  const StepperExampleScreen({super.key});

  @override
  State<StepperExampleScreen> createState() => _StepperExampleScreenState();
}

class _StepperExampleScreenState extends State<StepperExampleScreen> {
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
  bool _showInfo = false;
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
        subtitle: Text("Ism yoki faliliya kiriting"),
        isActive: true,
        state: _currentStep ==0 ? StepState.editing: _currentStep > 0? StepState.complete :StepState.indexed,
        content: Form(
          key: _stepFormKeys[0],
          child: TextFormField(
            key: _nameKey,
            controller: _nameController,
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Ismingizni kiriting ...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red)),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            validator: (value) {
              if ((value!.isEmpty)) {
                return 'Username can\'t be empty?  ';
              } else if (value.length < 3) {
                return 'Username must have at minimum 3 letters?';
              }
              return null;
            },
          ),
        ),
      ),
      Step(
        title: Text("Email"),
        subtitle: Text("emailingizni kiriting"),
        isActive: true,
        state: _currentStep ==1 ? StepState.editing: _currentStep > 1? StepState.complete :StepState.disabled,
        content: Form(
          key: _stepFormKeys[1],
          child: TextFormField(
            key: _emailKey,
            controller: _emailController,
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Ismingizni kiriting ...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red)),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            validator: (value) {
              if ((value!.isEmpty)) {
                return 'Email can\'t be empty?  ';
              } else if (value.length < 4) {
                return 'Email must have at minimum 4 letters?';
              }
              return null;
            },
          ),
        ),
      ),
      Step(
        title: Text("Parol"),
        subtitle: Text("Parolingizni kiriting"),
        isActive: true,
        state: _currentStep ==2 ? StepState.editing: _currentStep > 2 ? StepState.complete :StepState.disabled,
        content: Form(
          key: _stepFormKeys[2],
          child: TextFormField(
            key: _passwordKey,
            controller: _passwordController,
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Ismingizni kiriting ...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red)),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            validator: (value) {
              if ((value!.isEmpty)) {
                return 'Password can\'t be empty?  ';
              } else if (value.length < 4) {
                return 'Password must have at minimum 4 letters?';
              }
              return null;
            },
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper widget"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              steps: steps,
              currentStep: _currentStep,
              onStepTapped: (step) {

                if (step < _currentStep) {
                  setState(() {
                    _currentStep = step;
                  });
                } else {
                  _stepFormKeys[_currentStep].currentState!.validate();
                }

                if (_textFieldKeys[_currentStep].currentState?.isValid) {
                  setState(() {
                    _currentStep = step;
                  });
                }
              },
              onStepContinue: () {
                _stepFormKeys[_currentStep].currentState!.validate();
                if (_textFieldKeys[_currentStep].currentState?.isValid) {
                  setState(() {
                    if (_currentStep != (steps.length - 1)) {
                      _currentStep += 1;
                    } else if (_currentStep == steps.length - 1) {
                      _showInfo = true;
                      print("Steplar tugadi bosh sahifaga hush kelibsiz");
                    }
                  });
                }
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep != 0) {
                    _currentStep -= 1;
                  }
                });
              },
            ),

            Visibility(
              visible: _showInfo,
              child: Column(
                children: [
                  const Text("Tabriklaymiz Sizning malumotlaringiz", style: TextStyle(fontSize: 22)),
                  Text("Ismingiz: ${_nameController.text}", style: const TextStyle(fontSize: 20)),
                  Text("Emailingiz: ${_emailController.text}", style: const TextStyle(fontSize: 20)),
                  Text("Parolingiz: ${_passwordController.text}", style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
