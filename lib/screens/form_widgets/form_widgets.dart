import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  bool _isChecked = false;
  bool _switchValue = false;
  String _groupValue = "jins";
  Color _tileColor = Colors.transparent;
  Color _colorOfScaffold = Colors.white;
double _sliderValue =0.0;
var _dropValue ="uzb";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorOfScaffold,
      appBar: AppBar(
        title: const Text("Form widgets"),
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black),
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Type here ...",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: Icon(Icons.person),
                        suffixIconColor: Colors.black,
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black)),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.red)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                    validator: (value) {
                      if ((value!.isEmpty)) {
                        return 'Username can\'t be empty?  ';
                      } else if (value.length < 3) {
                        return 'Username must have at minimum 3 letters?';
                      }
                      return null;
                    },
                  ),

                  // CheckboxListTile
                  CheckboxListTile(
                      value: _isChecked,
                      title: const Text("Checkbox title"),
                      hoverColor: Colors.red,
                      tileColor: _tileColor,
                      subtitle: const Text("Checkbox subtitle"),
                      secondary:
                          _isChecked ? Icon(Icons.check) : Icon(Icons.close),
                      onChanged: (v) {
                        setState(() {
                          _isChecked = !_isChecked;
                          _tileColor = _tileColor == Colors.transparent
                              ? Colors.deepOrange
                              : Colors.transparent;
                        });
                      }),
                  // checkbox
                  Checkbox(
                      value: _isChecked,
                      hoverColor: Colors.red,
                      semanticLabel: "semanticLabel",
                      onChanged: (v) {
                        print("checkbox value:$v");
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      }),
                  //RadioListTile
                  RadioListTile(
                      value: "Erkak",
                      groupValue: _groupValue,
                      secondary: const Icon(Icons.man),
                      selectedTileColor: Colors.purple,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: const Text("Erkak"),
                      onChanged: (v) {
                        setState(() {
                          print(" radio value:$v");
                          _groupValue = v!;
                        });
                      }),
                  RadioListTile(
                      value: "Ayol",
                      groupValue: _groupValue,
                      secondary: const Icon(Icons.woman),
                      selectedTileColor: Colors.purple,
                      title: const Text("Ayol"),
                      onChanged: (v) {
                        setState(() {
                          print(" radio value:$v");
                          _groupValue = v!;
                        });
                      }),
                  //Switch
                  Switch(
                      value: _switchValue,
                      onChanged: (v) {
                        setState(() {
                          _switchValue = !_switchValue;
                          _colorOfScaffold = _colorOfScaffold == Colors.teal
                              ? Colors.white
                              : Colors.teal;
                        });
                      }),
                  CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (v) {
                        setState(() {
                          _switchValue = !_switchValue;
                          _colorOfScaffold = _colorOfScaffold == Colors.teal
                              ? Colors.white
                              : Colors.teal;
                        });
                      }),
                 //Slider
                  Slider(value: _sliderValue,
                      inactiveColor: Colors.red,
                      divisions: 10,
                      onChanged: (v){
                    print("slider value:$v");
                    setState(() {
                      _sliderValue =v;
                    });
                  }),
                  CupertinoSlider(value: _sliderValue,
                      thumbColor: Colors.orange,
                      onChanged: (v){
                    print("slider value:$v");
                    setState(() {
                      _sliderValue =v;
                    });
                  }),
                 //DropdownButton
                 DropdownButtonHideUnderline(child:  DropdownButton(
                     value: _dropValue,
                     items: const [
                       DropdownMenuItem(
                         child: Text("Itiyoriy widget"),
                         value: "Ixtiyoriy value",
                       ),
                       DropdownMenuItem(
                         child: Text("Uzb"),
                         value: "uzb",
                       ),
                       DropdownMenuItem(
                         child: Text("Ru"),
                         value: "ru",
                       ),
                       DropdownMenuItem(
                         child: Text("Eng"),
                         value: "eng",
                       ),
                     ],
                     onChanged: (v){
                       setState((){
                         _dropValue =v.toString() ;
                       });
                     })),

                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.green,
                              content: Text('Successfully registered'),
                            ),
                          );
                        }
                      },
                      child: const Text("Send"))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
