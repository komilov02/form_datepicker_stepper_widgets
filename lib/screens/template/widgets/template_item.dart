import 'package:assets/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateItem extends StatelessWidget {
  const TemplateItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonText});

  final String title;
  final String subTitle;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                spreadRadius: 10,
                blurRadius: 8,
                color: Colors.grey.shade200,
                offset: const Offset(2, 4))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orange,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/google.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      subTitle,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                      ),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    if(buttonText !=null) const SizedBox(height: 20,),
                    if(buttonText !=null)  TextButton(onPressed: ()  {} , child: Text(buttonText! , style: const TextStyle(
                        color: Colors.green
                    ),)),

                  ],
                ),
              ),


            ],
          ),

        ],
      ),
    );
  }
}
