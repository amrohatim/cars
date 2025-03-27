// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  PageController pageController = PageController();
  bool isSigUppage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset("assets/images/car.jpg", fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          const Color.fromARGB(120, 0, 0, 0),
                          const Color.fromARGB(140, 0, 0, 0),
                          const Color.fromARGB(166, 0, 0, 0),
                          const Color.fromARGB(204, 0, 0, 0),
                          const Color.fromARGB(214, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25.w,
                    top: 60.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8).w,
                        color: const Color.fromARGB(57, 255, 255, 255),
                      ),
                      child: Text(
                        "Wlecome",
                        style: GoogleFonts.mali(
                          color: const Color.fromARGB(255, 52, 188, 212),
                          fontSize: 38.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25.w,
                    top: 110.h,
                    child: Text(
                      "To CarBy",
                      style: GoogleFonts.roboto(
                        color: Colors.white70,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15.w,
                    top: 160.h,
                    child: Text(
                      "An advanced platform for displaying cars that keep",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15.w,
                    top: 175.h,
                    child: Text(
                      "pace with civilization and customers’ aspirations we",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15.w,
                    top: 195.h,
                    child: Text(
                      "offer ",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 55.w,
                    top: 197.5.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4).w,
                      child: Text(
                        "Affordable",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).w,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 135.w,
                    top: 197.5.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).w,
                        color: MyColors.primaryColor,
                      ),
                      child: Text(
                        "Proved ",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 195.w,
                    top: 197.5.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).w,
                        color: MyColors.primaryColor,
                      ),
                      child: Text(
                        "Urban",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 245.w,
                    top: 195.h,
                    child: Text(
                      "cars out of the box.",
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Column(
                children: [
                  Container(
                    width: 300.w,
                    height: 55.h,
                    padding: EdgeInsets.all(5).w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50).w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            isSigUppage = false;
                            pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceIn,
                            );
                            setState(() {});
                          },
                          child: Container(
                            width: 144.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: isSigUppage == true
                                  ? Colors.grey.shade400
                                  : MyColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50).w,
                                bottomLeft: Radius.circular(50.w),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Log In",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: isSigUppage == true
                                      ? Color.fromARGB(179, 255, 255, 255)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            isSigUppage = true;
                            pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceIn,
                            );
                            setState(() {});
                          },
                          child: Container(
                            width: 144.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: isSigUppage == false
                                  ? Colors.grey.shade400
                                  : MyColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50).w,
                                bottomRight: Radius.circular(50.w),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: isSigUppage == false
                                      ? Color.fromARGB(179, 255, 255, 255)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    height: 600,
                    child: PageView(
                      controller: pageController,
                      children: [Login(), Signup()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
