import 'package:flutter/material.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/ui/widgets/list_tile_news.dart';
class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({super.key});

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Saved news",style: AppTextStyle.instance.w700.copyWith(
          fontSize: FontSizeConst.instance.largeFont,
          color: AppColors.whiteColor
        ),),
      ),
      backgroundColor: AppColors.mainBackGround,
      body:ListView.builder(itemCount:10,itemBuilder: (context,index)=>ListTileNews())
    );
  }
}
