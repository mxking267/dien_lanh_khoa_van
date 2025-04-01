import 'package:dien_lanh_khoa_van/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/services/services_screen.dart';
import 'presentation/screens/booking/booking_screen.dart';
import 'presentation/screens/activities/activities_screen.dart';
import 'presentation/screens/account/account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ServicesScreen(),
    BookingScreen(),  // Page Booking thứ 3 (index 2)
    ActivitiesScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
