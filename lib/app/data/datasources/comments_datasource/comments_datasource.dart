import 'package:news_hub/app/core/network/network_interface.dart';
import 'package:news_hub/app/core/network/network_result.dart';
import 'package:news_hub/app/data/models/comments/comments_request_model.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';

class CommentsDatasource {
  final NetworkInterface network;

  const CommentsDatasource({required this.network});

  Future<List<CommentsModel>> getComments({required CommentsRequestModel request}) async {
    final commentsResult = await network.get<List<dynamic>>(
      url: 'contents/${request.userId}/${request.slug}/children',
    );

    switch (commentsResult) {
      case Success(data: final commentsData):
        return commentsData.map((value) => CommentsModel.fromJson(value)).toList();
      case Failure(networkException: final error):
        throw error;
    }
  }
}
