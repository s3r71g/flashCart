import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},),
          title: Center(
            child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: (){},),
          ],
          elevation: 20.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              CategoryCard(title: 'Vegetables', imagePath: 'categories/vegetables.svg'),
              CategoryCard(title: 'Fruits', imagePath: 'categories/fruits.svg'),
              CategoryCard(title: 'Edible oil', imagePath: 'categories/oil.svg'),
              CategoryCard(title: 'Beverages', imagePath: 'categories/beverages.svg'),
              CategoryCard(title: 'Grocery', imagePath: 'categories/grocery.svg'),
              CategoryCard(title: 'Babycare', imagePath: 'categories/babycare.svg'),
              CategoryCard(title: 'Hygiene', imagePath: 'categories/hygiene.svg'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            // Handle bottom navigation bar item clicks here.
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<String> getImageUrl(String imagePath) async {
  final ref = firebase_storage.FirebaseStorage.instance.ref().child(imagePath);
  final url = await ref.getDownloadURL();
  return url;
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath; // Replace 'icon' with 'imagePath'

  const CategoryCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImageUrl(imagePath),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.network(snapshot.data as String, height: 60),
                SizedBox(height: 10),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        } else {
          return AspectRatio(
            aspectRatio: 1,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
