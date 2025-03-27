import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/widgets/logintextfiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool shortpass(input) {
    if (input.length < 8) {
      return true;
    } else {
      return false;
    }
  }

  bool emptypass(input) {
    if (input.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var values;
  bool validemail(input) {
    if (EmailValidator.validate(input)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Mylogintextfiled(
            validator: (value) {
              if (emptypass(value)) {
                return "this field is requierd";
              } else if (validemail(value)) {
                return null;
              } else {
                return "Please enter a vaild email";
              }
            },
            controller: emailController,
            hinttext: "Email",
            obscureText: false,
            iconData: Icons.person,
          ),
          SizedBox(height: 30.h),
          Mylogintextfiled(
            validator: (value) {
              if (emptypass(value)) {
                return "this field is requierd";
              } else if (shortpass(value)) {
                return "Password is too short";
              } else {
                return null;
              }
            },
            controller: passwordController,
            hinttext: "Password",
            obscureText: true,
            iconData: Icons.password,
          ),
          SizedBox(height: 40.h),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  login();
                }
              },
              child: Container(
                width: 350.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).w,
                  color: MyColors.primaryColor,
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 30.h),
            child: Row(
              children: [
                Text(
                  "Don't have an account ?",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade500,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "Sign Up",
                  style: GoogleFonts.roboto(
                    color: MyColors.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (contex) => HomeScreen()));
    } on FirebaseException catch (e) {
      setState(() {});
      awesomeTopSnackbar(context, "${e.message}",
          backgroundColor: Colors.red,
          icon: const Icon(Icons.close, color: Colors.white),
          iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ));
    }
  }
}
