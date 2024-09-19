import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List?> getNews() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // log(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['articles'] as List;
      return result;
    } else {
      return null;
    }
  }

  static Future<List?> getByGeneral () async {
    String  url =
        'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['articles'] as List;
      return result;
    } else {
      return null;
    }
  }
  static Future<List?> getBusiness() async {
    String  url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['articles'] as List;
      return result;
    } else {
      return null;
    }
  }
  static Future<List?> getBySports() async {
    String  url =
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['articles'] as List;
      return result;
    } else {
      return null;
    }
  }
  static Future<List?> getByTech() async {
    String  url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=d9f35a744d684e14b251181fcf21c42d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['articles'] as List;
      return result;
    } else {
      return null;
    }
  }
}
