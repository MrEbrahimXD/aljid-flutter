import 'package:flutter/material.dart';

// Google Nav Bar
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// Pages of the NavBar
import 'package:aljid/HomePageTabs/Home.dart';
import 'package:aljid/HomePageTabs/Hifth.dart';
import 'package:aljid/HomePageTabs/Revising.dart';
import 'package:aljid/HomePageTabs/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Hifth(),
    Revising(),
    Settings(),
  ];

  final List<Color> _bgColors = [
    Colors.red, // Change these to your preferred colors
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142E2B),
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF142E2B),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.15),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: const Color(0xFFEAD67F),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 200),
              tabBackgroundColor: const Color(0xFF1A3935),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text:
                      'الرئيسية', // Replace 'Home' with the Arabic name of Alraisia
                ),
                GButton(
                  icon: Icons
                      .favorite, // Replace with a suitable icon for Al Hifth
                  text: 'الحفظ', // Replace 'Likes' with 'Al Hifth' in Arabic
                ),
                GButton(
                  icon: Icons.edit, // Replace with a suitable icon for Revising
                  text:
                      'المراجعة', // Replace 'Search' with 'Revising' in Arabic
                ),
                GButton(
                  icon: Icons.settings,
                  text:
                      'الإعدادات', // Replace 'Profile' with 'Settings' in Arabic
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
