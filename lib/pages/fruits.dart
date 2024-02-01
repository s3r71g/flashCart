import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Fruits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          title: Center(
            child: Text("Categories",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          elevation: 20.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            CategoryCard(
                title: 'Fruits & Vegetables',
                icon: 'assets/vegetables.svg',
                items: [
                  ItemCard(
                    title: 'Freshly Fresh',
                    items: [
                      'Desi Tomato (750 g)',
                      'Kashmeri Apple (1000g)',
                      'Shop Explore Potato (300g)',
                      'Ooty Carrot (1000g)',
                    ],
                    images: [
                      'assets/desi_tomato.png',
                      'assets/kashmeri_apple.png',
                      'assets/shop_explore_potato.png',
                      'assets/ooty_carrot.png',
                    ],
                  ),
                  // ItemCard(title: 'Exotics', items: [
                  //   'Ooty Carrot (1000g)',
                  // ]),
                ]),
          ],
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
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final List<ItemCard> items;

  const CategoryCard({required this.title, required this.icon, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SvgPicture.asset(icon, height: 60),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return items[index];
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final List<String> items;
  final List<String> images;

  const ItemCard({required this.title, required this.items, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 500,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items in each row
              childAspectRatio: 1.0, // Aspect ratio of the items
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between items
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(images[index], height: 50),
                    SizedBox(height: 10),
                    Text(items[index]),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}