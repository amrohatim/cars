// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/wallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InstallmentsPage extends StatefulWidget {
  final Map<String, dynamic> car;
  String paymentType;
  InstallmentsPage({required this.car, this.paymentType = "cash"});

  @override
  _InstallmentsPageState createState() => _InstallmentsPageState();
}

class _InstallmentsPageState extends State<InstallmentsPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  late String selectedPayment =
      widget.paymentType; // Default payment: Cash Installment
  // Fixed: Two years (24.sp months)
  bool is24 = true;
  late double price;

  @override
  void initState() {
    super.initState();
    price =
        double.parse(widget.car["price"].replaceAll(RegExp(r'[^0-9]'), '')) /
            24;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();

    animation = Tween(begin: pi, end: 0.0).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.car["name"]),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Car Image
              Center(
                child: Image.asset(
                  widget.car["image"],
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),

              // 🔹 Car Details
              Text(
                widget.car["name"],
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Model: ${widget.car["model"]}",
                style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
              // Text(
              //   "Type: ${widget.car["type"]}",
              //   style: TextStyle(fontSize: 18.sp),
              // ),
              // Text(
              //   "Color: ${widget.car["color"]}",
              //   style: TextStyle(fontSize: 18.sp),
              // ),
              SizedBox(height: 10.sp),
              Text(
                "Total Price: ${widget.car["price"]}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp.sp,
                ),
              ),
              SizedBox(height: 10.h),

              // 🔹 Choose Payment Method
              Text(
                "Choose payment method:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Text(
                "Installment period:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Radio(
                        activeColor: MyColors.primaryColor,
                        value: true,
                        groupValue: is24,
                        onChanged: (value) {
                          setState(() {
                            is24 = value!;
                          });
                        },
                      ),
                      Text(
                        "2 Years",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30.w),
                  Column(
                    children: [
                      Radio(
                        activeColor: MyColors.primaryColor,
                        value: false,
                        groupValue: is24,
                        onChanged: (value) {
                          setState(() {
                            is24 = value!;
                          });
                        },
                      ),
                      Text(
                        "1 Year",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(8).w,
                margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset("assets/images/dollars.png", scale: 15.r),
                          SizedBox(width: 5.w),
                          Text(
                            "Cash Installment",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 52, 212, 92),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        activeColor: const Color.fromARGB(255, 52, 212, 92),
                        value: "cash",
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value.toString();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset("assets/images/salary.png", scale: 15.r),
                          SizedBox(width: 5.w),
                          Text(
                            "Bank Installment",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 230, 167, 50),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        activeColor: const Color.fromARGB(255, 230, 167, 50),
                        value: "bank",
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Installment Details
              SizedBox(height: 10.h),
              Text(
                "📌 Installment Details:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              Text(
                "📅 Installment Duration: ${is24 ? 24 : 12} months (${is24 ? 2 : 1}years)",
              ),
              SizedBox(height: 10.h),

              Text(
                "💰 Monthly Installment: ${is24 ? price.toStringAsFixed(0) : (price * 2).toStringAsFixed(0)} SDG",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.sp),
              ),

              if (selectedPayment == "cash") ...[
                SizedBox(height: 10.h),
                Text(
                  "⚠️ Monthly installment must be paid manually at the office.",
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  "📍 Address: Nile Street - Khartoum",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "⏰ Payment Hours: Sunday to Thursday (9 AM - 5 PM)",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
              if (selectedPayment == "bank") ...[
                SizedBox(height: 10.h),
                Text(
                  "📌 Bank Transfer Details:",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Wallet(
                          instullmentPayment: is24
                              ? price.toStringAsFixed(0)
                              : (price * 2).toStringAsFixed(0),
                        );
                      },
                    ),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).w,
                    ),
                    color: MyColors.primaryColor,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Your Wallet",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setTranslationRaw(
                                    animation.value * 14,
                                    0,
                                    0,
                                  ),
                                child: Image.asset(
                                  "assets/images/wallet.png",
                                  scale: 5,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.all(8).w,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10).w,
                            ),
                            child: Text(
                              "Click to Pay",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
