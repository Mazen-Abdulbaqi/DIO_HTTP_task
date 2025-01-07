import 'package:dio/dio.dart';
import 'article.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await _dio.get(
        'everything',
        queryParameters: {
          'q': 'apple',
          'from': '2025-01-06',
          'to': '2025-01-06',
          'sortBy': 'popularity',
          'apiKey': 'b2be55b36de44cdf9e5c39242892f8cc',
        },
      );

      if (response.statusCode == 200) {
        final List articles = response.data['articles'];
        return articles.map((article) => Article.fromJson(article)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      throw Exception('Failed to fetch data');
    }
  }
}
