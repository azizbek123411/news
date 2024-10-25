import "package:flutter/material.dart";
import "package:iconly/iconly.dart";
import "package:news_app/config/appcolors.dart";
import "package:news_app/config/font_size.dart";
import "package:news_app/config/text_styles.dart";

import "../../widgets/list_tile_news.dart";

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainBackGround,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    firstDate: DateTime(2023),
                    lastDate: DateTime.now());
              },
              icon: Icon(
                IconlyBold.calendar,
                color: AppColors.whiteColor,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            'Explore',
            style: AppTextStyle.instance.w900.copyWith(
                fontSize: FontSizeConst.instance.largeFont,
                color: AppColors.whiteColor),
          ),
          bottom: TabBar(
              unselectedLabelStyle: AppTextStyle.instance.w700.copyWith(
                color: AppColors.whiteGrey,
              ),
              labelStyle: AppTextStyle.instance.w900
                  .copyWith(color: AppColors.whiteColor),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                color: AppColors.navBar,
              ),
              tabAlignment: TabAlignment.center,
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
        ),
        body: TabBarView(
          children: [

          ],
        ),
      ),
    );
  }
}
