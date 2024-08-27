import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/repository/models/news_model.dart';
import 'package:news_app/repository/service/api_service.dart';

final newsProvider=FutureProvider<NewsModel?>((ref)async{
// return await ApiService.getNews();
});