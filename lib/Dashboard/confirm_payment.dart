import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPayment extends StatefulWidget {
  const ConfirmPayment({super.key});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
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
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                            ),
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
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                            ),
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    MyColors.primaryColor,
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Confirm Payment',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
