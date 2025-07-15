import 'package:ahtizam/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:ahtizam/src/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../messages/presentation/screens/messages_screen.dart';
import '../../../my_orders/presentation/screens/my_orders.dart';
import '../widgets/bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<Widget> _pages = [
    HomeScreen(),
    OrdersScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime? _lastBackPressed;
  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) >= const Duration(seconds: 2)) {
      _lastBackPressed = now;
      Fluttertoast.showToast(
        msg: 'click_again_to_exit'.tr(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return; // Already handled

        if (!await _onWillPop()) return;

        SystemNavigator.pop(); // Do the pop manually
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
