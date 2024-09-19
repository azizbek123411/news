import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/screen_utils.dart';

import '../../config/font_size.dart';
import '../../config/text_styles.dart';

class ListTileNews extends StatelessWidget {
  String? category;
  String imageUrl;
  String title;

   ListTileNews({
    super.key,
     this.category,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dis.only(tb: 8.h,),
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
          child:Image(image: NetworkImage(imageUrl,),),
        ),
        title: Text(
          category!,
          style: AppTextStyle.instance.w600.copyWith(
            fontSize: FontSizeConst.instance.smallFont,
            color: AppColors.whiteGrey,
          ),
        ),
        subtitle: Text(
          title,
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
