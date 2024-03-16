import 'package:assets/screens/template/widgets/template_item.dart';
import 'package:assets/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Title",
          style: TextStyle(
            color: AppColors.orange,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(

          children: [
            TemplateItem(
                title: "order location",
                subTitle: "Test order location title Test order location ",
                buttonText: null),
            SizedBox(height: 30,),
            TemplateItem(
                title: "order location 2",
                subTitle: "Hello order location title Test order location ",
                buttonText: "nimadir"),
          ],
        ),
      ),
    );
  }
}
