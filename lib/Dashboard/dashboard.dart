// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard/add_car.dart';
import 'package:flutter_application_2/Dashboard/confirm_payment.dart';
import 'package:flutter_application_2/Dashboard/installments_follow.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({super.key, this.outgoing});
  final outgoing;

  @override
  State<Adminpanel> createState() => _AdminpanelState(outgoing);
}

class _AdminpanelState extends State<Adminpanel> {
  String? outgoing;
  _AdminpanelState(this.outgoing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        foregroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: Text("Admin Panel", style: GoogleFonts.notoSansAdlam()),
        ),
      ),
      drawer: Padding(
        padding: EdgeInsets.only(top: 90.h, right: 200.w),
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              InkWell(
                onTap: () {
                  outgoing = "user";
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10).w),
                    color: MyColors.primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                    vertical: 20.h,
                  ),
                  child: Text(
                    "Add Car",
                    style: GoogleFonts.notoSansAdlam(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  outgoing = "outgoing";
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10).w),
                    color: MyColors.primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 20.h,
                  ),
                  child: Text(
                    "Confirm Payment",
                    style: GoogleFonts.notoSansAdlam(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  outgoing = "Blocked";
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10).w),
                    color: MyColors.primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 20.h,
                  ),
                  child: Text(
                    "Follow Payments",
                    style: GoogleFonts.notoSansAdlam(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  outgoing = "reports";
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10).w),
                    color: MyColors.primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.w,
                    vertical: 20.h.h,
                  ),
                  child: Text(
                    "Reports",
                    style: GoogleFonts.notoSansAdlam(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 300.h),
              InkWell(
                onTap: () async {
                  // await FirebaseAuth.instance.signOut();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const MyregPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login, color: Colors.black, size: 40.sp),
                    SizedBox(width: 10.w),
                    Text("Logout", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: outgoing == "outgoing"
          ? ConfirmPayment()
          : outgoing == "Blocked"
              ? InstallmentsFollow()
              : outgoing == "user"
                  ? Signup()
                  : AddCar(),
    );
  }
}
