import 'package:flutter/material.dart';
import 'package:news_task_http/logic/article.dart' as article_logic;
import '../logic/news_service.dart';
import 'detailsscreen.dart';

class NewsScreen extends StatelessWidget {
  final NewsService _newsService = NewsService();

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('News HTTP Task',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
              textAlign: TextAlign.center),
        ),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<article_logic.Article>>(
        future: _newsService.fetchArticles()
            as Future<List<article_logic.Article>>?,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<article_logic.Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Image.network(articles[index].urlToImage ??
                      'https://via.placeholder.com/150'),
                  title: Text(articles[index].title ?? 'No Title'),
                  subtitle:
                      Text(articles[index].description ?? 'No Description'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailScreen(article: articles[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(child: Text('No news available.'));
        },
      ),
    );
  }
}
