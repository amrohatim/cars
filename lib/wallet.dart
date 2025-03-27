import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_constant.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key, this.instullmentPayment});
  final instullmentPayment;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  Map<String, dynamic>? paymentIntent;
  TextEditingController amountcontroller = new TextEditingController();

  // getthesharedpref() async {
  //   wallet = await SharedPreferenceHelper().getUserWallet();
  //   id = await SharedPreferenceHelper().getUserId();
  //   setState(() {});
  // }

  // ontheload() async {
  //   await getthesharedpref();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   ontheload();
  //   super.initState();
  // }\
  @override
  void initState() {
    wallet = "100,000 SDG";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 65.w),
            child: Text("Wallet"),
          ),
        ),
        backgroundColor: MyColors.primaryColor,
      ),
      body: wallet == null
          ? CircularProgressIndicator()
          : SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.0.h,
                      horizontal: 30.0.w,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.primaryColor,
                        width: 2,
                      ),
                      color: Color.fromARGB(255, 41, 41, 41),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/wallet.png",
                          height: 60.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 40.0.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Wallet Balance",
                              style: GoogleFonts.cairo(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0.w),
                            Text(
                              wallet!,
                              style: GoogleFonts.cairo(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0.h),

                  SizedBox(height: 15.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Text(
                          "Make Payment :",
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          makePayment(widget.instullmentPayment);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5).w,
                          width: 200.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            borderRadius: BorderRadius.circular(5).w,
                          ),
                          child: Center(
                            child: Text(
                              "Pay ${widget.instullmentPayment} SDG",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     makePayment('500');
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.all(5).w,
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: Color(0xffe9e2e2)),
                      //       borderRadius: BorderRadius.circular(5).w,
                      //     ),
                      //     child: Text("\$" + "500"),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     makePayment('1000');
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.all(5).w,
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: Color(0xffe9e2e2)),
                      //       borderRadius: BorderRadius.circular(5).w,
                      //     ),
                      //     child: Text("\$" + "1000"),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     makePayment('2000');
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.all(5).w,
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: Color(0xffe9e2e2)),
                      //       borderRadius: BorderRadius.circular(5).w,
                      //     ),
                      //     child: Text("\$" + "2000"),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 50.0.h),
                  // GestureDetector(
                  //   onTap: () {
                  //     openEdit();
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 20.0),
                  //     padding: EdgeInsets.symmetric(vertical: 12.0),
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xff008080),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Add Money",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16.0,
                  //           fontFamily: 'Poppins',
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'EGP');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Adnan',
            ),
          )
          .then((value) {});

      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        // await SharedPreferenceHelper().saveUserWallet(add.toString());
        // await DatabaseMethods().UpdateUserwallet(id!, add.toString());
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    Text("Payment Successful"),
                  ],
                ),
              ],
            ),
          ),
        );

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:---> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print("Error is:---> $e");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text("Cancelled")),
      );
    } catch (e) {
      print("$e");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100);
    return calculateAmount.toString();
  }

  Future openEdit() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 60.0),
                      Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                            color: Color(0xff008080),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h),
                  Text("Amount"),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: amountcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Amount',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        makePayment(amountcontroller.text);
                      },
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(5).w,
                        decoration: BoxDecoration(
                          color: Color(0xFF008080),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
