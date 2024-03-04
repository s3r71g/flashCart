import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'categories.dart';
import 'home_page.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _phoneNumberErrorText = '';

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _validatePhoneNumber(String value) {
    setState(() {
      if (value.length != 10) {
        _phoneNumberErrorText = 'Phone number must be 10 digits long';
      } else {
        _phoneNumberErrorText = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details",style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 20.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _phoneNumberController,
                  onChanged: _validatePhoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    errorText: _phoneNumberErrorText.isNotEmpty ? _phoneNumberErrorText : null,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save user details logic here
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
        selectedItemColor: Color(0xff6c63ff),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          switch(index) {
            case 0:
            // Handle home navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()), // Navigate to CartPage
              );
              break;
            case 1:
            // Handle explore navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categories()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()), // Navigate to CartPage
              );
              break;
            case 3:
            // Handle account navigation
              break;
          }
        },
      ),
    );
  }
}
