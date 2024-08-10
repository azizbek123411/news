import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/space.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/repository/providers/news_api_provider.dart';
import 'package:news_app/ui/widgets/home_news_card.dart';

import '../../widgets/list_tile_news.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(newsProvider);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainBackGround,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "News Feed",
            style: AppTextStyle.instance.w900.copyWith(
              fontSize: FontSizeConst.instance.largeFont,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        body: Padding(
          padding: Dis.only(lr: 10.w, tb: 10.h),
          child: SingleChildScrollView(
            child: provider.when(
                data: (data) {
                  return Column(
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
                              return HomeNewsCard(
                                title: data!.title.toString(),
                                datetime: data.publishedAt.toString(),
                                imageUrl: data.urlImage??"",
                                type: data.author.toString(),
                              );
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
                      TabBar(
                          unselectedLabelStyle:
                              AppTextStyle.instance.w700.copyWith(
                            color: AppColors.whiteGrey,
                          ),
                          labelStyle: AppTextStyle.instance.w900
                              .copyWith(color: AppColors.whiteColor),
                          tabAlignment: TabAlignment.center,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            color: AppColors.navBar,
                          ),
                          isScrollable: false,
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Tab(
                              text: "All",
                            ),
                            Tab(
                              text: "Technology",
                            ),
                            Tab(
                              text: "Sport",
                            ),
                            Tab(
                              text: "Social",
                            ),
                          ]),
                      HBox(15.h),
                      SizedBox(
                        height: 450.h,
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const ListTileNews(),
                            ),
                            ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const ListTileNews(),
                            ),
                            ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const ListTileNews(),
                            ),
                            ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const ListTileNews(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (error, st) {
                  log("Error:", error: error, stackTrace: st);
                },
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          ),
        ),
      ),
    );
  }
}
