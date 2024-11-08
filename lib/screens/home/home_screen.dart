import 'package:flutter/material.dart';
import 'package:my_chat/common/res/colors.dart';
import 'package:my_chat/common/widget/home_live_card.dart';
import 'package:my_chat/common/widget/home_trendy_card.dart';

import '../../common/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(),
            _buildMiddleSection(),
            _buildBottomSection(),
            SizedBox(height: 8)
          ],
        ),
      )),
    );
  }

  Widget _buildTopSection() {
    return Container(
      color: Colors.blue.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              '베스트 셀러 실시간 라이브',
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(top: 8, left: 16, bottom: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return HomeTrendyCard(
                    bannerImage: 'assets/images/trendy_img1.png',
                    profileImage: 'assets/images/trendy_img1.png',
                    shopName: 'TrendyShop $index',
                    viewersText: 'Viewers: ${index}',
                    description: 'Description for trendy shop $index',
                    bannerColor: Colors.red,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleSection() {
    return Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                '팔로잉 셀러',
              ),
            ),
            SizedBox(
              height: 150,
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomeLiveCard(
                      labelText: 'TrendyShop',
                      imageUrl: 'assets/images/trendy_img1.png',
                      isLive: true,
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildBottomSection() {
    return Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                '실시간 라이브',
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomeTrendyCard(
                      bannerImage: 'assets/images/trendy_img1.png',
                      profileImage: 'assets/images/trendy_img1.png',
                      shopName: 'TrendyShop $index',
                      viewersText: 'Viewers: ${index}',
                      description: 'Description for trendy shop $index',
                      bannerColor: Colors.black.withOpacity(0.4),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
