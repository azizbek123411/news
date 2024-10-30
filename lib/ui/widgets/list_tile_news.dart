import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/ui/screens/full_news_page.dart';

import '../../config/font_size.dart';
import '../../config/text_styles.dart';
import '../../repository/models/news_model.dart';

class ListTileNews extends StatefulWidget {
  String? category;
  String imageUrl;
  String title;
  NewsModel model;
  void Function() onTap;

  ListTileNews(
      {super.key,
      this.category,
        required this.onTap,
      required this.imageUrl,
      required this.title,
      required this.model});

  @override
  State<ListTileNews> createState() => _ListTileNewsState();
}

class _ListTileNewsState extends State<ListTileNews> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullNewsPage(newsModel: widget.model),
          ),
        );
      },
      child: Container(
        margin: Dis.only(
          tb: 8.h,
        ),
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
            child: Image(
              image: NetworkImage(
                widget.imageUrl,
              ),
            ),
          ),
          title: Text(
            widget.category ?? "",
            style: AppTextStyle.instance.w600.copyWith(
              fontSize: FontSizeConst.instance.smallFont,
              color: AppColors.whiteGrey,
            ),
          ),
          subtitle: Text(
            widget.title,
            style: AppTextStyle.instance.w600.copyWith(
              fontSize: FontSizeConst.instance.mediumFont,
              color: AppColors.whiteColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: IconButton(
            onPressed: widget.onTap,
            icon: const Icon(Icons.bookmark),
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
