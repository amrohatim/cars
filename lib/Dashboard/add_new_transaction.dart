import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewTransaction extends StatefulWidget {
  const AddNewTransaction({super.key});

  @override
  State<AddNewTransaction> createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Inputs
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Transaction UID',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Account number',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            cursorColor: MyColors.primaryColor,
            decoration: InputDecoration(
              hintText: 'Payment Recivied',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.primaryColor),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          TextFormField(
            cursorColor: MyColors.primaryColor,
            decoration: InputDecoration(
              hintText: 'Buyer name',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.primaryColor),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),

          // Car ID
          TextFormField(
            cursorColor: MyColors.primaryColor,
            decoration: InputDecoration(
              hintText: 'Car ID',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.primaryColor),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),

          const SizedBox(height: 32),

          // Add Car Button
          SizedBox(
            width: double.infinity,
            child: Container(
              width: 370.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(6).w,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(48, 0, 0, 0),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text(
                      "Add new transaction ",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
