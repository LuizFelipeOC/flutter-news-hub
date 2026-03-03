import 'package:news_hub/app/data/datasources/comments_datasource/comments_datasource.dart';
import 'package:news_hub/app/data/models/comments/comments_request_model.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';

class CommentsRepository {
  final CommentsDatasource datasource;

  CommentsRepository({required this.datasource});

  Future<List<CommentsModel>> getComments({required CommentsRequestModel request}) async {
    return await datasource.getComments(request: request);
  }
}
