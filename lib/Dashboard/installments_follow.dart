import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard/mange_installment.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InstallmentsFollow extends StatefulWidget {
  @override
  _InstallmentsFollowState createState() => _InstallmentsFollowState();
}

class _InstallmentsFollowState extends State<InstallmentsFollow> {
  final List<Map<String, dynamic>> cars = [
    {
      "name": "عمرو",
      "account number": "2022563",
      "price_received": "1000 SDG",
      "total_price": "10,000 SDG /Month",
      "image": "assets/images/amro.jpg",
      "car_name": "Camery",
      "car_id": "1222",
    },
    {
      "name": "برعي",
      "account number": "2022563",
      "price_received": "5000 SDG",
      "total_price": "50,000 SDG /Month",
      "image": "assets/images/pro.jfif",
      "car_name": "Mitsbutshi",
      "car_id": "2000",
    },
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              cursorColor: MyColors.primaryColor,
              decoration: InputDecoration(
                hintText: "Search for person...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                if (searchText.isEmpty ||
                    car["name"].toLowerCase().contains(searchText)) {
                  return carCard(context, car);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // كود البطاقة مع التنقل لصفحة التفاصيل
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MangeInstallment()),
          );
        },
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
                  Text(
                    "car: ${car["car_name"]}",
                    style: GoogleFonts.notoSansAdlam(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                  Container(
                    width: 250,
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
                    "Total: ${car["total_price"]}",
                    style: GoogleFonts.notoSansAdlam(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: MyColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
