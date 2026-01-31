import 'package:flutter/material.dart';
import 'package:news_hub/app/data/models/comments/comments_request_model.dart';
import 'package:news_hub/app/data/models/comments/coomments_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';
import 'package:news_hub/app/data/repository/comments/comments_repository.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/pages/new_content/new_content_state.dart';

class NewContentController extends ValueNotifier<INewContentState> {
  final NewsRepository newsRepository;
  final CommentsRepository commentsRepository;

  NewContentController({
    required this.newsRepository,
    required this.commentsRepository,
  }) : super(NewContentInitialState());

  Future<void> fetchNewContentsById({
    required String slug,
    required String userId,
  }) async {
    try {
      _emitState(NewContentLoadingState());

      final datas = await Future.wait([
        newsRepository.fetchContentById(userId: userId, slug: slug),
        commentsRepository.getComments(
          request: CommentsRequestModel(userId: userId, slug: slug),
        ),
      ]);

      final commentsList = datas[1] as List<CommentsModel>;

      _emitState(
        NewContentLoadedState(
          newsItem: datas[0] as NewsModel,
          comments: commentsList,
        ),
      );
    } catch (e) {
      _emitState(
        NewContentErrorState(
          message: 'Erro ao carregar o conteúdo da notícia.',
        ),
      );
    }
  }

  void _emitState(INewContentState state) {
    value = state;
  }
}
