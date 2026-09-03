import 'package:flutter/material.dart';

import 'package:news_application/features/news/data/model/article_model.dart';
import 'package:news_application/features/news/screens/article_details_screen.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },


      child: Card(
        margin: EdgeInsets.all(10),

        elevation: 3,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            if (article.photoUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),

                child: Image.network(
                  article.photoUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 200,
                      child: Center(child: Icon(Icons.image_not_supported)),
                    );
                  },
                ),
              ),
            Padding(
              padding: EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    article.sourceName,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    article.publishedDatetimeUtc,

                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
