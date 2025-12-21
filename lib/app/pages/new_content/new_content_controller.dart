import 'package:flutter/material.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/pages/new_content/new_content_state.dart';

class NewContentController extends ValueNotifier<INewContentState> {
  final NewsRepository repository;

  NewContentController({required this.repository}) : super(NewContentInitialState());

  Future<void> fetchNewContentsById({required String slug, required String userId}) async {
    try {
      _emitState(NewContentLoadingState());

      final newsItem = await repository.fetchContentById(userId: userId, slug: slug);

      _emitState(NewContentLoadedState(newsItem: newsItem));
    } catch (e) {
      _emitState(NewContentErrorState(message: 'Erro ao carregar o conteúdo da notícia.'));
    }
  }

  void _emitState(INewContentState state) {
    value = state;
  }
}
