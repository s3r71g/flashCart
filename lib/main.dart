import 'package:flutter/material.dart';

import 'pages/getotp.dart';
// import 'pages/get_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter OTP Verification',
      debugShowCheckedModeBanner: false,
      // home: GetOtp(),
      home: Register(),

    );
  }
}

