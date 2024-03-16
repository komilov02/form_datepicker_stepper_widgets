
import 'package:assets/screens/form_widgets/date_picker.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const DatePickerScreen(),
  ));
}