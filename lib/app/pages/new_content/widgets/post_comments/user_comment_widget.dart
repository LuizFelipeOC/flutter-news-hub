import 'package:flutter/material.dart';
import 'package:news_hub/app/core/utils/date_formart.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';

class UserCommentWidget extends StatelessWidget {
  final CommentsModel commentsModel;

  const UserCommentWidget({super.key, required this.commentsModel});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final date = DateFormart();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colors.primary,
              child: Text(
                commentsModel.ownerUsername.isNotEmpty
                    ? commentsModel.ownerUsername[0].toUpperCase()
                    : '?',
                style: textStyles.bodyMedium?.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          commentsModel.ownerUsername,
                          style: textStyles.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        date.formatDate(dateString: commentsModel.createdAt),
                        style: textStyles.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: MarkdownBody(
                      data: commentsModel.body,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet(
                        p: textStyles.bodyMedium?.copyWith(height: 1.4),
                        strong: textStyles.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        em: textStyles.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),

        if (commentsModel.children.isNotEmpty) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 56.0),
            child: Column(
              children: commentsModel.children
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: UserCommentWidget(commentsModel: child),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ],
    );
  }
}
