import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  ImagePicker imagePicker = ImagePicker();
  File? producPic;
  getimage() async {
    var xFile = await imagePicker.pickImage(source: ImageSource.gallery);

    producPic = File(xFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24).w,
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
                          hintText: 'Total Price',
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
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        cursorColor: MyColors.primaryColor,
                        decoration: InputDecoration(
                          hintText: 'Month installment',
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
            SizedBox(height: 24.h),

            // Email
            TextFormField(
              cursorColor: MyColors.primaryColor,
              decoration: InputDecoration(
                hintText: 'Car Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryColor),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24.h),

            // Password
            TextFormField(
              cursorColor: MyColors.primaryColor,
              decoration: InputDecoration(
                hintText: 'Car Model',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryColor),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.h),

            // Confirm Password
            TextFormField(
              cursorColor: MyColors.primaryColor,
              decoration: InputDecoration(
                hintText: 'Car status',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryColor),
                ),
              ),
              obscureText: true,
            ),

            const SizedBox(height: 32),
            producPic == null
                ? InkWell(
                    onTap: () {
                      getimage();
                    },
                    child: Container(
                      width: 150.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(83, 150, 152, 157),
                        borderRadius: BorderRadius.all(Radius.circular(4).w),
                      ),
                      child: Center(child: Icon(Icons.add_a_photo, size: 35.r)),
                    ),
                  )
                : Stack(
                    children: [
                      SizedBox(width: 170, height: 110),
                      Container(
                        width: 150.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(producPic!.path)),
                          ),
                          color: Color.fromARGB(83, 150, 152, 157),
                          borderRadius: BorderRadius.all(Radius.circular(4).w),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            getimage();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: MyColors.primaryColor,
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              color: const Color.fromARGB(207, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

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
                  padding: EdgeInsets.all(12).w,
                  child: Text(
                    'Add Car',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
