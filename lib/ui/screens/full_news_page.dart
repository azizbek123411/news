import 'package:flutter/material.dart';
import 'package:news_app/config/app_padding.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/screen_utils.dart';
import 'package:news_app/config/space.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/repository/models/news_model.dart';

class FullNewsPage extends StatefulWidget {
  NewsModel newsModel;

  FullNewsPage({super.key, required this.newsModel});

  @override
  State<FullNewsPage> createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<FullNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackGround,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: Dis.only(lr: 10.w, tb: 5.h),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage("${widget.newsModel.urlImage}"),
              ),
            ),
            HBox(20.h),
            Text("${widget.newsModel.title}",style: AppTextStyle.instance.w700.copyWith(
              fontSize: FontSizeConst.instance.largeFont,
              color: AppColors.whiteColor,
            ),),
            HBox(30.h),
            Text("${widget.newsModel.publishedAt}  ",style: AppTextStyle.instance.w700.copyWith(
              fontSize: FontSizeConst.instance.mediumFont,
              color: AppColors.greyColor,
            ),),
            Text("${widget.newsModel.author}",style: AppTextStyle.instance.w700.copyWith(
              fontSize: FontSizeConst.instance.mediumFont,
              color: AppColors.greyColor,
            ),),
            HBox(30.h),
            Text("${widget.newsModel.content}",style: AppTextStyle.instance.w700.copyWith(
              fontSize: FontSizeConst.instance.mediumFont,
              color: AppColors.whiteColor,
            ),),

          ],
        ),
      ),
    );
  }
}
