import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/screen_utils.dart';

import '../../config/font_size.dart';
import '../../config/text_styles.dart';

class ListTileNews extends StatefulWidget {
  const ListTileNews({super.key});

  @override
  State<ListTileNews> createState() => _ListTileNewsState();
}

class _ListTileNewsState extends State<ListTileNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dis.only(tb: 10.h),
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.navBar,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/cnn.png',
          ),
        ),
        title: Text(
          'Social',
          style: AppTextStyle.instance.w600.copyWith(
            fontSize: FontSizeConst.instance.smallFont,
            color: AppColors.whiteGrey,
          ),
        ),
        subtitle: Text(
          'Google loses massive antitrust lawsuit over its search dominance',
          style: AppTextStyle.instance.w600.copyWith(
            fontSize: FontSizeConst.instance.mediumFont,
            color: AppColors.whiteColor,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark),
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
