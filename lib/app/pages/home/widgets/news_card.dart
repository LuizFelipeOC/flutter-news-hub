import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hub/app/data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsItem});

  final NewsModel newsItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.push('/news-page', extra: {'id': newsItem.id, 'userId': newsItem.ownerId});
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                newsItem.title,
                style: textStyle.bodyLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: colors.primary,
                        radius: 12,
                        child: Text(
                          newsItem.ownerUsername[0],
                          style: textStyle.bodySmall?.copyWith(
                            color: colors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(newsItem.ownerUsername),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.comment, size: 16, color: colors.onSurfaceVariant),
                      SizedBox(width: 4),
                      Text(newsItem.childrenDeepCount.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
