import 'package:flash_cart/pages/categories.dart';
import 'package:flutter/material.dart';
import 'package:flash_cart/pages/getotp.dart';

import 'pages/getotp.dart';
// import 'pages/get_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OTP Verification',
      debugShowCheckedModeBanner: false,
      home: Register(),
      // home: Categories(),
    );
  }
}

