import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/space.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/repository/models/news_model.dart';
import 'package:news_app/repository/service/api_service.dart';
import 'package:news_app/ui/widgets/home_news_card.dart';

import '../../widgets/list_tile_news.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> items = [];
  List<NewsModel> generalList = [];
  List<NewsModel> businessList = [];
  List<NewsModel> sportsList = [];
  List<NewsModel> techList = [];


  void addToCart( NewsModel news){
Provider.of<NewsSaved>(context,listen:false).save_a_news(news);
  }

  Future<void> getNews() async {
    final response = await ApiService.getNews();
    setState(() {
      items = response;
    });
    }

  Future<void> getGeneral() async {
    final response = await ApiService.getByGeneral();
    setState(() {
      generalList = response;
    });
    }
  Future<void> getBusiness()async{
    final response=await ApiService.getBusiness();
    setState(() {
      businessList=response;
    });
    }
  Future<void> getSports()async {
    final response=await ApiService.getBySports();
    setState(() {
      sportsList=response;
    });
    }
  Future<void> getTech()async{
    final response=await ApiService.getByTech();
    setState(() {
      techList=response;
    });
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
                      final item = items[index];
                      return HomeNewsCard(
                        model: item,
                        title: item.title ?? "",
                        datetime: item.publishedAt.toString(),
                        type: item.author?? "",
                        imageUrl: item.urlImage ??
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
                            onTap: () =>addToCart,

                            imageUrl: categories.urlImage ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories.title ?? "Unknown Title", model: categories,
                          );
                        }),
                    ListView.builder(
                        itemCount: businessList.length,
                        itemBuilder: (context, index) {
                          final categories = businessList[index];
                          return ListTileNews(
                            onTap: () =>addToCart,

                            model: categories,
                            imageUrl: categories.urlImage ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories.title ?? "Unknown Title",
                          );
                        }),
                    ListView.builder(
                        itemCount: sportsList.length,
                        itemBuilder: (context, index) {
                          final categories = sportsList[index];
                          return ListTileNews(
                            onTap: () =>addToCart,

                            model: categories,
                            imageUrl: categories.urlImage ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories.title ?? "Unknown Title",
                          );
                        }),
                    ListView.builder(
                        itemCount: techList.length,
                        itemBuilder: (context, index) {
                          final categories = techList[index];
                          return ListTileNews(
                            onTap: () =>addToCart,

                            model: categories,
                            imageUrl: categories.urlImage ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY0m-GvsveJ0QM1RacSZkMH5E-DuhMZYu_kA&s",
                            title: categories.title ?? "Unknown Title",
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}
