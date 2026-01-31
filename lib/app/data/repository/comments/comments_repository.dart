import 'dart:convert';

import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:news_hub/app/data/models/comments/comments_request_model.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';

class CommentsRepository {
  final IHttpClient httpClient;

  CommentsRepository({required this.httpClient});

  Future<List<CommentsModel>> getComments({
    required CommentsRequestModel request,
  }) async {
    final commentsResponse = await httpClient.get(
      path: 'contents/${request.userId}/${request.slug}/children',
    );

    final commentsDecode = jsonDecode(commentsResponse);
    final comments = commentsDecode as List<dynamic>;

    if (comments.isEmpty) {
      return [];
    }

    final mappedComments = comments
        .map((comment) => CommentsModel.fromJson(comment))
        .toList();

    return mappedComments;
  }
}
