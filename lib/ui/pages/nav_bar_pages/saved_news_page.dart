import 'package:flutter/material.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/config/font_size.dart';
import 'package:news_app/config/text_styles.dart';
import 'package:news_app/repository/models/news_model.dart';
import 'package:news_app/repository/service/api_service.dart';
import 'package:news_app/ui/widgets/list_tile_news.dart';
import 'package:provider/provider.dart';

class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({super.key});

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  void removeCart(NewsModel model) {
    Provider.of<NewsSaved>(context, listen: false).removeNews(model);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsSaved>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Saved news",
            style: AppTextStyle.instance.w700.copyWith(
                fontSize: FontSizeConst.instance.largeFont,
                color: AppColors.whiteColor),
          ),
        ),
        backgroundColor: AppColors.mainBackGround,
        body: ListView.builder(
            itemCount: value.savedNews.length,
            itemBuilder: (context, index) {
              NewsModel news = value.savedNews[index];
              return ListTileNews(
                onTap: () {},
                imageUrl: news.urlImage.toString(),
                title: news.title.toString(),
                model: news,
              );
            }),
      ),
    );
  }
}
