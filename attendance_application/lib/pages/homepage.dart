import 'package:attendance_application/pages/dashboard.dart';
import 'package:attendance_application/pages/profile_page/profilepage.dart';
import 'package:attendance_application/pages/recent_activity/recent_activity.dart';
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
    const MyDashBoard(),
    const MyRecentActivity(),
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
              color: const Color.fromARGB(255, 0, 109, 119),
              showLabel: false,
              notchColor: const Color.fromARGB(255, 0, 109, 119),

              /// Restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 131, 197, 190),
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'History',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.history,
                    color: Color.fromARGB(255, 131, 197, 190),
                  ),
                  activeItem: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 131, 197, 190),
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
