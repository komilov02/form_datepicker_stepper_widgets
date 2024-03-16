import 'package:assets/screens/form_widgets/form_widgets.dart';
import 'package:assets/screens/form_widgets/step_horizontal.dart';
import 'package:assets/screens/form_widgets/stepper_indexed.dart';
import 'package:assets/screens/form_widgets/stepper_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  final DateTime _now = DateTime.now();
  final DateTime _lastDate = DateTime(2025);
  final DateTime _firstDate = DateTime(2022, 1, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DatePickerScreen "),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          OutlinedButton(
            child: const Text("Android date picker"),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: _now,
                firstDate: _firstDate,
                lastDate: _lastDate,
              ).then((value) {
                debugPrint("value:$value");
                debugPrint("timeZoneName:${value?.timeZoneName}");
                debugPrint("timeZoneOffset:${value?.timeZoneOffset}");
                debugPrint("toIso8601String:${value?.toIso8601String()}");
                debugPrint("toLocal:${value?.toLocal()}");
                debugPrint("toUtc:${value?.toUtc()}");
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            child: const Text("Ios date picker"),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.teal,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: CupertinoDatePicker(
                            initialDateTime: _now,
                            onDateTimeChanged: (DateTime value) {
                              print("now:$_now");
                              print("ios value:$value");
                              print("ios value:${value.toIso8601String()}");
                            },
                            maximumDate: _lastDate,
                            minimumDate: _firstDate,
                          ),
                        ),
                        CupertinoButton(
                            child: const Text(
                              "Ok",
                              style: TextStyle(),
                            ),
                            onPressed: () => Navigator.of(context).pop()),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FormWidgets()));
              },
              child: const Text("Go Form widgets")),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StepperExampleScreen()));
              },
              child: const Text("Go Stepper disabled example")),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StepperIndexedExampleScreen()));
              },
              child: const Text("Go Stepper indexed example")),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StepperHorizontalExampleScreen()));
              },
              child: const Text("Go Stepper horizontal example")),

        
        ]),
      ),
    );
  }
}
