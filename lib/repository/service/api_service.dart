import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:news_app/repository/models/news_model.dart';

class ApiService {
  static final Uri uri = Uri.parse(
    'https://newsapi.org/v2/top-headlines?country=us&apiKey=d9f35a744d684e14b251181fcf21c42d',
  );

  static Future<NewsModel?> getNews() async {
    // List<NewsModel> news = [];
    final response = await get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      final newsList = jsonDecode(response.body);
      return NewsModel.fromJson(newsList);
    }
  }
}
