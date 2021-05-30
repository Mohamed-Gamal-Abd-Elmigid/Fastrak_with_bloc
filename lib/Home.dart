import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/profile/UI/dashbord.dart';
import 'package:test_bloc/profile/UI/menu.dart';
import 'package:test_bloc/profile/UI/order.dart';
import 'package:test_bloc/profile/UI/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 2;
  final tabs = [
    Order(),
    Dashbord(),
    // Profile(),
    Dashbord(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[currentIndex],
      bottomNavigationBar: bottomNavigator(),
    );
  }

  Widget bottomNavigator() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.purple,

      type: BottomNavigationBarType.shifting,
      // showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/order.png',
            width: 20,
          ),
          title: Text('Order'),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/dashbord.png',
            width: 20,
          ),
          title: Text('Dashbord'),
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? Image.asset(
                  'assets/profile.png',
                  width: 20,
                )
              : Image.asset(
                  'assets/defaultProfile.png',
                  width: 20,
                ),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/menu.png',
            width: 20,
          ),
          title: Text('Menu'),
        ),
      ],
    );
  }
}
