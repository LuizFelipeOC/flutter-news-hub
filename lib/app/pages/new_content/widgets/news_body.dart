import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:news_hub/app/core/utils/date_formart.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';

class NewsBody extends StatelessWidget {
  final NewsModel newsItem;

  const NewsBody({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final date = DateFormart();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: colors.primary,
                child: Text(
                  newsItem.ownerUsername[0].toUpperCase(),
                  style: textStyle.bodyMedium?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.ownerUsername,
                      style: textStyle.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date.formatDate(dateString: newsItem.createdAt),
                      style: textStyle.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            newsItem.title,
            style: textStyle.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 24),

          MarkdownBody(
            data: newsItem.body,
            styleSheet: MarkdownStyleSheet(
              p: textStyle.bodyLarge?.copyWith(height: 1.6),
              h1: textStyle.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              h2: textStyle.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              h3: textStyle.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),

              strong: textStyle.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              em: textStyle.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
              code: textStyle.bodyMedium?.copyWith(
                fontFamily: 'monospace',
                backgroundColor: colors.surfaceContainerHigh,
              ),
              codeblockDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.outlineVariant),
              ),
              blockquote: textStyle.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
              ),
              blockquoteDecoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: colors.primary, width: 4),
                ),
              ),
              listBullet: textStyle.bodyLarge?.copyWith(),
            ),
            selectable: true,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
