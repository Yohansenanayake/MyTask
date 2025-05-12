import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_frontend/constants/colors.dart';
import 'package:todo_frontend/features/authentication/bloc/auth_bloc.dart';
import 'package:todo_frontend/features/authentication/ui/loginScreen.dart';
import 'package:todo_frontend/models/user_model.dart';
import 'package:todo_frontend/widgets/custom_button.dart';
import 'package:todo_frontend/widgets/custom_textfield.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthBloc _authBloc = AuthBloc();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is SignUpInProgressState) {
            isLoading = true;
          } else if (state is SignUpSuccessState) {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Sign Up Succesfull",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.accentColor,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Loginscreen()),
            );
          } else if (state is SignUpErrorState) {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset("assets/images/signUpImage.png"),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.signUpAccentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.fontColorBlack,
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 25),
                          CustomTextfield(
                            controller: _nameController,
                            labelText: "Name",
                            borderColor: Colors.white,
                          ),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller: _emailController,
                            labelText: "Email",
                            borderColor: Colors.white,
                          ),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller: _passwordController,
                            labelText: "Password",
                            borderColor: Colors.white,
                          ),
                          SizedBox(height: 20),
                          isLoading
                              ? SizedBox(
                                width: screenWidth,
                                height: 55,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                              : GestureDetector(
                                onTap: () {
                                  UserModel userModel = UserModel(
                                    name: _nameController.text,
                                    userId: "",
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    FcmToken: "",
                                  );
                                  _authBloc.add(
                                    SignUpEvent(userModel: userModel),
                                  );
                                },
                                child: CustomButton(
                                  btnWidth: screenWidth,
                                  btnText: "Sign up",
                                ),
                              ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Already have an acoount?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginscreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColors.accentColor,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
