import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/src/features/home/presentation/screens/home_screen.dart';

import '../widgets/bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Orders Page", style: TextStyle(fontSize: 20))),
    Center(child: Text("Messages Page", style: TextStyle(fontSize: 20))),
    Center(child: Text("Profile Page", style: TextStyle(fontSize: 20))),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
