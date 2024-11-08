import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_chat/common/res/colors.dart';
import 'package:my_chat/common/widget/search_following_card.dart';
import 'package:my_chat/common/widget/search_hashtag_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> hashtags = [
    '패션의류',
    '패션잡화',
    '쥬얼리',
    '뷰티',
    '가구/인테리어',
    '디지털/가전',
    '출산/유아동',
    '스포츠/레저/자동차',
    '생활/주방',
    '식품',
    '반려동물',
    '취미',
    '빈티지/중고',
  ];

  final List<Color> colors = [
    Colors.blue,
    Colors.blue.shade100,
  ];

  Color getRandomColor() {
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHashTagSection(),
            _buildFollowingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHashTagSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '카테고리',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: hashtags
                .map((hashtag) => SearchHashtagCard(
                      text: hashtag,
                      color: getRandomColor(),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingSection() {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 8, bottom: 8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SearchFollowingCard(
            profileImageUrl: 'assets/images/trendy_img1.png',
            shopName: 'Trendyshop',
            description: '오늘도 무료배송 업로드했어요 신상가득 엄청 많아요',
            hashtags: '#Clothing #Fashion #Accessories',
            followers: '${index + 1000} Followers',
            likes: '${index + 100} ',
            onFollowPressed: () {},
            onCardPressed: () {},
          );
        },
      ),
    );
  }
}
