import 'package:flutter/material.dart';
import '../logic/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'No Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                article.urlToImage ?? 'https://via.placeholder.com/150'),
            SizedBox(height: 10),
            Text(article.title ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(article.description ?? 'No Description'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                if (article.url != null) {
                  (article.url!);
                }
              },
              child: Text('Read Full Article'),
            ),
          ],
        ),
      ),
    );
  }
}
