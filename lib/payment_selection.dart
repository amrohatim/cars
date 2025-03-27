import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/installments_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSelection extends StatelessWidget {
  final Map<String, dynamic> car;
  const PaymentSelection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Payment selection",
          style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
        ),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All payments are made in convenient installments",
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Color.fromARGB(199, 0, 0, 0),
              ),
            ),
            SizedBox(height: 15.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InstallmentsPage(car: car);
                    },
                  ),
                );
              },
              child: Container(
                width: 350.w,
                height: 140.h,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 52, 212, 92),
                  borderRadius: BorderRadius.circular(8).w,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/dollars.png"),
                    SizedBox(width: 20.w),
                    Text(
                      "Cash Payments",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InstallmentsPage(car: car, paymentType: "bank");
                    },
                  ),
                );
              },
              child: Container(
                width: 350.w,
                height: 140.h,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 94, 89, 84),
                  borderRadius: BorderRadius.circular(8).w,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/salary.png"),
                    SizedBox(width: 10.w),
                    Text(
                      "Bank Payments",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
