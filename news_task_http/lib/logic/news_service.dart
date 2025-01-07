import 'dart:convert';
import 'package:http/http.dart' as http;

import 'article.dart';

class NewsService {
  final String apiKey = 'b2be55b36de44cdf9e5c39242892f8cc';

  Future<List<Article>> fetchArticles() async {
    final String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('Response JSON: $jsonResponse');

      if (jsonResponse['articles'] != null) {
        final List articles = jsonResponse['articles'];
        if (articles.isNotEmpty) {
          return articles.map((article) => Article.fromJson(article)).toList();
        } else {
          print('No articles found');
          return [];
        }
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception(
          'Failed to load news. Status code: ${response.statusCode}');
    }
  }
}
