import 'package:flutter/material.dart';
import 'package:news_hub/app/data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsItem});

  final NewsModel newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(12.0), child: Text(newsItem.title)),
    );
  }
}
