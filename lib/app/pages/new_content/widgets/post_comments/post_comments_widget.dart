import 'package:flutter/material.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';
import 'package:news_hub/app/pages/new_content/widgets/post_comments/user_comment_widget.dart';

class PostCommentsWidget extends StatelessWidget {
  final CommentsModel commentsModel;

  const PostCommentsWidget({super.key, required this.commentsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UserCommentWidget(commentsModel: commentsModel),
    );
  }
}
