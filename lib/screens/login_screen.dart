import 'package:assets/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset("assets/icons/prev_icon.svg"),
        ),
        title: const Text(
          "Log in",
          style: TextStyle(
            color: Color(0xFF1A72DD),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.getSize(),
              ),
              const Text(
                "Welcome to MokPOS!",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 8.getSize(),
              ),
              const Text(
                "Select login at the owner or employee fast to continue",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 50.getSize(),
              ),
              Image.asset(
                "assets/images/login_img.png",
                width: 500,
                height: 200,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 50.getSize(),
              ),
              _myButton(
                  iconPath: "assets/icons/google.svg",
                  title: "Log in as owner"),
              SizedBox(
                height: 12.getSize(),
              ),
              const Center(
                child: Text(
                  "or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 12.getSize(),
              ),
              _myButton(
                  iconPath: "assets/icons/google.svg",
                  title: "Log in as employee"),
              SizedBox(
                height: 12.getSize(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 4.getSize(),
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Button generate function
  _myButton({required String iconPath, required String title}) {
    return SizedBox(
      height: 57.getSize(),
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF1A72DD),
              padding: const EdgeInsets.only(left: 24, right: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "$iconPath",
                width: 30,
                height: 30,
                // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              Text(
                "$title",
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox()
            ],
          )),
    );
  }
}
