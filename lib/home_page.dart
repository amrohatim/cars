import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/widgets/car_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> cars = [
    {
      "name": "Toyota Camry",
      "model": "2023",
      "price": "500,000 SDG",
      "installment": "10,000 SDG /Month",
      "image": "assets/images/toy.png",
      "status": "new",
    },
    {
      "name": "Mercedes C200",
      "model": "2021",
      "price": "950,000 SDG",
      "installment": "20,000 SDG /Month",
      "image": "assets/images/mar.png",
      "status": "new",
    },
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              cursorColor: MyColors.primaryColor,
              decoration: InputDecoration(
                hintText: "Search for car...",
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
            MaterialPageRoute(builder: (context) => CarDetailsScreen(car: car)),
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
                    "${car["name"]} - ${car["model"]}",
                    style: GoogleFonts.cairo(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total price: ${car["price"]}",
                    style: GoogleFonts.notoSansAdlam(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "installment: ${car["installment"]}",
                      style: GoogleFonts.notoSansAdlam(
                        color: MyColors.secondaryColor,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Status: ${car["status"]}",
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
