import 'package:firebase_core/firebase_core.dart';
import 'package:flash_cart/pages/cart_page.dart';
import 'package:flash_cart/pages/home.dart';
import 'package:flash_cart/pages/home_page.dart';
// import 'package:flash_cart/pages/enterotp.dart';
import 'firebase_options.dart';
import 'package:flash_cart/pages/categories.dart';
// import 'package:flash_cart/pages/fruits.dart';
import 'package:flutter/material.dart';
import 'package:flash_cart/pages/getotp.dart';
import 'pages/cart_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
        title: 'Flutter OTP Verification',
        debugShowCheckedModeBanner: false,
        // home: HomePagex(),
      home: Register(),
      // home: Otp(),
      // home: Categories(),
      // home: Fruits(),
      // home: HomePage(),
      //     home:CartPage(),
        ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Null Check Operator Error')),
//         body: MyList(),
//       ),
//     );
//   }
// }
//
// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//               return ListTile(
//                 title: Text('Item $index'),
//               );
//             },
//             childCount: 10,
//           ),
//         ),
//       ],
//     );
//   }
// }