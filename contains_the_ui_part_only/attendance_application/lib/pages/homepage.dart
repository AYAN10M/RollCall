import 'package:attendance_application/pages/dashboard.dart';
import 'package:attendance_application/pages/profilepage.dart';
import 'package:attendance_application/pages/recent_activity.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxPage = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Widget list
  final List<Widget> bottomBarPages = [
    const MyRecentActivity(),
    const MyDashBoard(),
    const MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxPage)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: const Color(0xFF424242),
              showLabel: false,
              notchColor: const Color(0xFF424242),

              /// Restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.history,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  itemLabel: 'Settings',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                /// Perform action on tab change and update pages without pages
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
              kBottomRadius: 30,
            )
          : null,

    );
  }
}
