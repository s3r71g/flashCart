import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              CategoryCard(title: 'Vegetables', icon: 'assets/vegetables.svg'),
              CategoryCard(title: 'Fruits', icon: 'assets/fruits.svg'),
              CategoryCard(title: 'Edible oil', icon: 'assets/oil.svg'),
              CategoryCard(title: 'Beverages', icon: 'assets/beverages.svg'),
              CategoryCard(title: 'Grocery', icon: 'assets/grocery.svg'),
              CategoryCard(title: 'Babycare', icon: 'assets/babycare.svg'),
              CategoryCard(title: 'Hygiene', icon: 'assets/hygiene.svg'),
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

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;

  const CategoryCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, height: 60),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}