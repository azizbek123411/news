import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/repository/models/news_model.dart';

class ApiService {
  static Future<List<NewsModel>> getNews() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // log(response.body);
    // if (response.statusCode == 200) {
    //   final json = jsonDecode(response.body) as Map;
    //   final result = json['articles'] as List;
    //   return result;
    // } else {
    //   return null;
    // }
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['articles'] as List<dynamic>;
    final users = result.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    return users;
  }

  static Future<List<NewsModel>> getByGeneral() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['articles'] as List<dynamic>;
    final users = result.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    return users;
  }

  static Future<List<NewsModel>> getBusiness() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['articles'] as List<dynamic>;
    final users = result.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    return users;
  }

  static Future<List<NewsModel>> getBySports() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['articles'] as List<dynamic>;
    final users = result.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    return users;
  }

  static Future<List<NewsModel>> getByTech() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['articles'] as List<dynamic>;
    final users = result.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    return users;
  }
}

class NewsSaved extends ChangeNotifier {
  List<NewsModel> savedNews = [];

  List<NewsModel> get saved => savedNews;

  void save_a_news(NewsModel news) {
    savedNews.add(news);
    notifyListeners();
  }

  void removeNews(NewsModel news){
    savedNews.remove(news);
    notifyListeners();
  }
}
