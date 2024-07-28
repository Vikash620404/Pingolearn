import 'package:flutter/material.dart';
import 'news_service.dart';

class NewsScreen extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: FutureBuilder<List<Article>>(
        future: newsService.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: articles[index].urlToImage != null ? Image.network(articles[index].urlToImage) : null,
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
