import 'package:flutter/material.dart';
import 'package:my_chat/common/res/colors.dart';
import 'package:my_chat/common/res/text_style.dart';
import 'package:my_chat/screens/feed_screen.dart';
import 'package:my_chat/screens/inbox_screen.dart';
import 'package:my_chat/screens/live_screen.dart';
import 'package:my_chat/screens/my_page_screen.dart';

import 'home/home_screen.dart';

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
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home_nav.png',
                  color: _currentIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/search_nav.png',
                  color: _currentIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                label: 'Feed'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/video_nav.png',
                  color: _currentIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                label: 'Live'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/chat_nav.png',
                  color: _currentIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/user_nav.png',
                  color: _currentIndex == 4
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                label: 'My Page'),
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
