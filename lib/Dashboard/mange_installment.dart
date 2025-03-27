import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard/add_new_transaction.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MangeInstallment extends StatefulWidget {
  const MangeInstallment({super.key});

  @override
  State<MangeInstallment> createState() => _MangeInstallmentState();
}

class _MangeInstallmentState extends State<MangeInstallment> {
  final List<Map<String, dynamic>> cars = [
    {
      "name": "Camery",
      "transaction_id": "2022563",
      "price_received": "1000 SDG",
      "total_price": "10,000 SDG /Month",
      "image": "assets/images/toy.png",
      "car_id": "10,000",
      "date":
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
    },
    {
      "name": "Camery",
      "transaction_id": "4522563",
      "price_received": "2000 SDG",
      "total_price": "10,000 SDG /Month",
      "image": "assets/images/toy.png",
      "car_id": "1222",
      "date": "${DateTime.now().year}-4-${DateTime.now().day}",
    },
  ];

  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Manage",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10).w,
              child: TextField(
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                  hintText: "Search by transaction ID...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.primaryColor),
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase();
                  });
                },
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 370.w,
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 20).w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(188, 0, 0, 0),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price : ${cars[0]["car_id"]} SDG",
                        style: GoogleFonts.openSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Remaining : 7,000 SDG",
                        style: GoogleFonts.openSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  Text("📑", style: TextStyle(fontSize: 45.sp)),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              child: SizedBox(
                height: 540.h,
                child: PageView(
                  children: [
                    ListView.builder(
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        if (searchText.isEmpty ||
                            car["transaction_id"].toLowerCase().contains(
                                  searchText,
                                )) {
                          return carCard(context, car);
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                    AddNewTransaction(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

Widget carCard(BuildContext context, Map<String, dynamic> car) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(143, 158, 158, 158),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              car["image"],
              width: 100.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${car["name"]}",
                  style: GoogleFonts.cairo(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Transaction ID: ${car["transaction_id"]}",
                    style: GoogleFonts.notoSansAdlam(
                      fontSize: 12.sp,
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "received: ${car["price_received"]}",
                    style: GoogleFonts.notoSansAdlam(
                      color: MyColors.secondaryColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                Text(
                  "Car ID: ${car["car_id"]}",
                  style: GoogleFonts.notoSansAdlam(
                    color: MyColors.secondaryColor,
                  ),
                ),
                Text(
                  "Date: ${car["date"]}",
                  style: GoogleFonts.notoSansAdlam(
                    color: MyColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
