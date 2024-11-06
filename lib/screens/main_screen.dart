import 'package:flutter/material.dart';
import 'package:my_chat/common/res/colors.dart';
import 'package:my_chat/common/res/text_style.dart';
import 'package:my_chat/screens/feed_screen.dart';
import 'package:my_chat/screens/inbox_screen.dart';
import 'package:my_chat/screens/live_screen.dart';
import 'package:my_chat/screens/my_page_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    HomeScreen(),
    FeedScreen(),
    LiveScreen(),
    InboxScreen(),
    MyPageScreen(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          // BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          unselectedIconTheme: IconThemeData(color: AppColors.greyColor),
          selectedLabelStyle: AppTextStyles.bottomNavText,
          unselectedLabelStyle: AppTextStyles.bottomNavText.copyWith(
            color: AppColors.greyColor,
          ),
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.videocam_outlined), label: 'Live'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'My Page'),
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
