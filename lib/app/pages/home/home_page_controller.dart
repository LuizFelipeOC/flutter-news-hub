import 'package:flutter/material.dart';
import 'package:news_hub/app/core/enums/news_enums/categories_enum.dart';
import 'package:news_hub/app/core/network/network_exception.dart';
import 'package:news_hub/app/data/models/news/new_request_model.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/pages/home/home_page_state.dart';

class HomePageController extends ValueNotifier<IHomePageState> {
  final NewsRepository newsRepository;

  HomePageController({required this.newsRepository}) : super(HomePageInitialState());

  Future<void> loadNews() async {
    _emitState(HomePageLoadingState());

    try {
      final newsData = await newsRepository.getNews(
        request: NewsRequestModel(page: 1, perPage: 20, strategy: CategoriesEnum.newContent),
      );

      if (newsData.isEmpty) {
        _emitState(HomePageEmptyState());
        return;
      }

      _emitState(HomePageLoadedState(news: newsData));
    } on NetworkException catch (error) {
      _emitState(HomePageErrorState(message: error.message));
    } catch (_) {
      _emitState(HomePageErrorState(message: 'Erro ao carregar notícias.'));
    }
  }

  void _emitState(IHomePageState state) {
    value = state;
  }
}
