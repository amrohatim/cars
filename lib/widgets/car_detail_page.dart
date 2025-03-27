import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/payment_selection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarDetailsScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          car["name"],
          style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
        ),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 200.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(car["image"]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0).w,
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: const Color.fromARGB(193, 0, 0, 0),
                  size: 40.r,
                ),
                SizedBox(width: 5.h),
                Text(
                  "Car Detail",
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(193, 0, 0, 0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              car["name"],
              style: GoogleFonts.cairo(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(4).w,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(4).w,
                  ),
                  child: Text(
                    "Model: ${car["model"]}",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(4).w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(99, 0, 0, 0),
                    borderRadius: BorderRadius.circular(4).w,
                  ),
                  child: Text(
                    "Total Price: ${car["price"]}",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(4).w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(99, 0, 0, 0),
                    borderRadius: BorderRadius.circular(4).w,
                  ),
                  child: Text(
                    "installment: ${car["installment"]}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(4).w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(99, 0, 0, 0),
                    borderRadius: BorderRadius.circular(4).w,
                  ),
                  child: Text(
                    "Status: ${car["status"]}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.all(16.0).w,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentSelection(car: car);
                    },
                  ),
                );
              },
              child: Container(
                width: 350.w,
                height: 120.h,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(8).w,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/atm.png"),
                    SizedBox(width: 20.w),
                    Text(
                      "Choose Payment",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
