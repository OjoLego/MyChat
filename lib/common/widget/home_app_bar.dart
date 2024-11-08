import 'package:flutter/material.dart';
import 'package:my_chat/common/res/colors.dart';
import 'package:my_chat/screens/home/search_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/icons/logo_home.png',
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'My Chat',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icons/search_app_bar.png',
            width: 24,
            height: 24,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
        ),
        IconButton(
          icon: Image.asset(
            'assets/icons/bell_notification.png',
            width: 24,
            height: 24,
            color: AppColors.primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
