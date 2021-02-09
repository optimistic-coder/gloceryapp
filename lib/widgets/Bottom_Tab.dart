import 'package:flutter/material.dart';
import 'package:grocery_test_app/pages/Cart/Cart.dart';
import 'package:grocery_test_app/pages/Home/Home.dart';
import 'package:grocery_test_app/pages/Wishlist/Wishlist.dart';
import 'package:grocery_test_app/pages/You/You.dart';

class BottomTab extends StatefulWidget {
  BottomTab({Key key}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Cart(),
    Wishlist(),
    You(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: Colors.black38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart_sharp,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              // color: Colors.black38,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              // color: Colors.black38,
            ),
            label: 'You',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff6FBE0B),
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
