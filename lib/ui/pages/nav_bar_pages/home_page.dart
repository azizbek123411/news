import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/space.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/ui/widgets/home_news_card.dart';

import '../../widgets/list_tile_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackGround,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "News Feed",
          style: AppTextStyle.instance.w700.copyWith(
            fontSize: FontSizeConst.instance.largeFont,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: Dis.only(lr: 10.w, tb: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular now',
                    style: AppTextStyle.instance.w700.copyWith(
                        fontSize: FontSizeConst.instance.largeFont,
                        color: AppColors.whiteColor),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: AppTextStyle.instance.w700.copyWith(
                          fontSize: FontSizeConst.instance.largeFont,
                          color: AppColors.whiteGrey),
                    ),
                  ),
                ],
              ),
              HBox(10.h),
              SizedBox(
                height: 302.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const HomeNewsCard();
                    }),
              ),
              HBox(20.h),
              Text(
                'Category News',
                style: AppTextStyle.instance.w700.copyWith(
                    fontSize: FontSizeConst.instance.largeFont,
                    color: AppColors.whiteColor),
              ),
              HBox(15.h),
              ListTileNews(),
              ListTileNews(),
              ListTileNews(),
              ListTileNews(),
            ],
          ),
        ),
      ),
    );
  }
}
