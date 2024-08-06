import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/text_styles.dart';

class HomeNewsCard extends StatefulWidget {
  const HomeNewsCard({super.key});

  @override
  State<HomeNewsCard> createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 270.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(
                20,
              ),
            ),
            child: Image(
              height: 200.h,
              image: const AssetImage(
                'assets/images/cnn.png',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: Dis.only(top: 160.h),
            height: 147.h,
            padding: Dis.only(lr: 8.w, tb: 10.h),
            decoration: BoxDecoration(
              color: AppColors.navBar,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyBold.time_circle,
                          color: AppColors.whiteColor,
                        ),
                        Text(
                          ' 2 hours ago',
                          style: TextStyle(
                            color: AppColors.whiteGrey,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.bookmark),
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
                // HBox(10.h),
                Text(
                  'Social',
                  style: AppTextStyle.instance.w600.copyWith(
                    fontSize: FontSizeConst.instance.smallFont,
                    color: AppColors.whiteGrey,
                  ),
                ),
                // HBox(10.h),
                Text(
                  'Google loses massive antitrust lawsuit over its search dominance',
                  style: AppTextStyle.instance.w600.copyWith(
                    fontSize: FontSizeConst.instance.mediumFont,
                    color: AppColors.whiteColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
