import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/text_styles.dart';

class HomeNewsCard extends StatelessWidget {
  String imageUrl;
  String datetime;
  String type;
  String title;

  HomeNewsCard({
    super.key,
    required this.title,
    required this.datetime,
    required this.imageUrl,
    required this.type,
  });

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
              image: NetworkImage(imageUrl??"data:image/jpeg;base64,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"),
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
                          "$datetime",
                          style: TextStyle(
                            color: AppColors.whiteGrey,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark),
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
                // HBox(10.h),
                Text(
                  type??'',
                  style: AppTextStyle.instance.w600.copyWith(
                    fontSize: FontSizeConst.instance.smallFont,
                    color: AppColors.whiteGrey,
                  ),
                ),
                // HBox(10.h),
                Text(
                  title??"",
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
