import 'package:flutter/material.dart';

import 'package:news_application/features/news/data/model/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;

  ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article Details")),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            if (article.photoUrl.isNotEmpty)
              Image.network(
                article.photoUrl,

                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 250,

                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
                  );
                },
              ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  article.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 12),
                  Text(
                    article.sourceName,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  SizedBox(height: 8),

                  Text(
                    article.publishedDatetimeUtc,

                    style: TextStyle(fontSize: 13),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Description",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Text(
                    article.snippet.isNotEmpty
                        ? article.snippet
                        : "No description available",

                    style: TextStyle(fontSize: 16),
                  ),
   
                  SizedBox(height: 20),

                  if (article.authors.isNotEmpty)
                    Text(
                      "Author: ${article.authors.join(", ")}",

                      style: TextStyle(fontSize: 16),
                    ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // later we can open the original article link
                    },
                    child: Text("Read Full Article"),
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
