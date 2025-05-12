import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_frontend/constants/colors.dart';
import 'package:todo_frontend/widgets/custom_button.dart';
import 'package:todo_frontend/widgets/custom_textfield.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.loginBGColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    width: screenWidth - 100,
                    child: Lottie.asset(
                      "assets/animations/loginAnimation.json",
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColors.fontColorBlack,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Welcome back to",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.labelTextColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "MyTask",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.accentColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      CustomTextfield(controller: _emailController, labelText: "Email", borderColor: AppColors.accentColor),
                      SizedBox(height: 15),
                      CustomTextfield(controller: _passwordController, labelText: "Password", borderColor: AppColors.accentColor),
                      SizedBox(height: 20),
                      CustomButton(btnWidth: screenWidth, btnText: "Login"),

                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "Dont have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
