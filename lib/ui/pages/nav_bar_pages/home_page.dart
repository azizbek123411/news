import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/space.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/repository/service/api_service.dart';
import 'package:news_app/ui/widgets/home_news_card.dart';

import '../../widgets/list_tile_news.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List items = [];
  List generalList = [];
  List businessList = [];
  List sportsList = [];
  List techList = [];

  Future<void> getNews() async {
    final response = await ApiService.getNews();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error Occured',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  Future<void> getGeneral() async {
    final response = await ApiService.getByGeneral();
    if (response != null) {
      setState(() {
        generalList = response;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error Occured',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
  Future<void> getBusiness()async{
    final response=await ApiService.getBusiness();
    if(response!=null){
      setState(() {
        businessList=response;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error Occured',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
  Future<void> getSports()async {
    final response=await ApiService.getBySports();
    if(response!=null){
      setState(() {
        sportsList=response;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error Occured',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
  Future<void> getTech()async{
    final response=await ApiService.getByTech();
    if(response!=null){
      setState(() {
        techList=response;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error Occured',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
    getGeneral();
    getBusiness();
    getSports();
    getTech();
  }

  @override
  Widget build(BuildContext context) {
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
                        color: AppColors.whiteColor,),
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
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index] as Map;
                      return HomeNewsCard(
                        title: item['title'] ?? "",
                        datetime: item['publishedAt'].toString() ?? "",
                        type: item['author'] ?? "",
                        imageUrl: item['urlToImage'] ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s',
                      );
                    }),
              ),
              HBox(20.h),
              Text(
                'Category News',
                style: AppTextStyle.instance.w700.copyWith(
                  fontSize: FontSizeConst.instance.largeFont,
                  color: AppColors.whiteColor,
                ),
              ),
              HBox(15.h),
              TabBar(
                  unselectedLabelStyle: AppTextStyle.instance.w700.copyWith(
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
                      text: "General",
                    ),
                    Tab(
                      text: "Business",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Technology",
                    ),
                  ]),
              HBox(15.h),
              SizedBox(
                height: 450.h,
                child: TabBarView(
                  children: [
                    ListView.builder(
                        itemCount: generalList.length,
                        itemBuilder: (context, index) {
                          final categories = generalList[index];
                          return ListTileNews(
                            imageUrl: categories['urlToImage'] ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories['title'] ?? "Unknown Title",
                          );
                        }),
                    ListView.builder(
                        itemCount: businessList.length,
                        itemBuilder: (context, index) {
                          final categories = businessList[index];
                          return ListTileNews(
                            imageUrl: categories['urlToImage'] ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories['title'] ?? "Unknown Title",
                          );
                        }),
                    ListView.builder(
                        itemCount: sportsList.length,
                        itemBuilder: (context, index) {
                          final categories = sportsList[index];
                          return ListTileNews(
                            imageUrl: categories['urlToImage'] ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories['title'] ?? "Unknown Title",
                          );
                        }),
                    ListView.builder(
                        itemCount: techList.length,
                        itemBuilder: (context, index) {
                          final categories = techList[index];
                          return ListTileNews(
                            imageUrl: categories['urlToImage'] ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories['title'] ?? "Unknown Title",
                          );
                        }),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
