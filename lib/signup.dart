import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:flutter_application_2/widgets/logintextfiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> keyform = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
      key: keyform,
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
            iconData: Icons.email,
          ),
          SizedBox(height: 30.h),
          Mylogintextfiled(
            iconData: Icons.person,
            controller: phoneController,
            hinttext: "User Name",
            obscureText: true,
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
            iconData: Icons.password,
            controller: passwordController,
            hinttext: "Password",
            obscureText: true,
          ),
          SizedBox(height: 40.h),
          InkWell(
            onTap: () {
              if (keyform.currentState!.validate()) {
                signup();
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
                  'Sign Up',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
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
                  "Already have an account ?",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade500,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "Log In",
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

  void signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
