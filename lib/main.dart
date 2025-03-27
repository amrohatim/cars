import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_constant.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/registeration.dart';
import 'package:flutter_application_2/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:typed_data/typed_data.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
  Stripe.publishableKey = publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7, 825.5),
      builder: (context, child) => const MaterialApp(
        home: Registeration(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
