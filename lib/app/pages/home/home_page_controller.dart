import 'package:flutter/material.dart';
import 'package:news_hub/app/core/network/network_exception.dart';
import 'package:news_hub/app/data/models/news/new_request_model.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/pages/home/home_page_state.dart';

class HomePageController extends ValueNotifier<IHomePageState> {
  final NewsRepository newsRepository;

  int page = 1;
  String currentCategory = 'new';

  bool isLoadingMore = false;
  bool hasMore = true;

  final scrollController = ScrollController();

  HomePageController({required this.newsRepository}) : super(HomePageInitialState()) {
    scrollController.addListener(onScroll);
  }

  Future<void> loadNews() async {
    page = 1;

    _emitState(HomePageLoadingState());

    try {
      final newsData = await newsRepository.getNews(
        request: NewsRequestModel(page: page, perPage: 20, strategy: currentCategory),
      );

      if (newsData.isEmpty) {
        _emitState(HomePageEmptyState());
        return;
      }
      page++;

      _emitState(HomePageLoadedState(news: newsData));
    } on NetworkException catch (error) {
      _emitState(HomePageErrorState(message: error.message));
    } catch (_) {
      _emitState(HomePageErrorState(message: 'Erro ao carregar notícias.'));
    }
  }

  Future<void> loadNewsByCategory(String category) async {
    currentCategory = category;
    page = 1;
    hasMore = true;

    _emitState(HomePageLoadingState());

    try {
      final newsData = await newsRepository.getNews(
        request: NewsRequestModel(page: page, perPage: 20, strategy: category),
      );

      if (newsData.isEmpty) {
        _emitState(HomePageEmptyState());
        return;
      }

      page++;
      _emitState(HomePageLoadedState(news: newsData));
    } on NetworkException catch (error) {
      _emitState(HomePageErrorState(message: error.message));
    } catch (_) {
      _emitState(HomePageErrorState(message: 'Erro ao carregar notícias.'));
    }
  }

  Future<void> loadMoreNews() async {
    if (value is! HomePageLoadedState) return;
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    try {
      final newsData = await newsRepository.getNews(
        request: NewsRequestModel(page: page, perPage: 20, strategy: currentCategory),
      );

      if (newsData.isEmpty) {
        hasMore = false;
        return;
      }

      page++;

      final currentState = value as HomePageLoadedState;

      _emitState(HomePageLoadedState(news: [...currentState.news, ...newsData]));
    } on NetworkException catch (error) {
      _emitState(HomePageErrorState(message: error.message));
    } catch (_) {
      _emitState(HomePageErrorState(message: 'Erro ao carregar notícias.'));
    } finally {
      isLoadingMore = false;
    }
  }

  void onScroll() {
    if (!scrollController.hasClients) return;

    final threshold = scrollController.position.maxScrollExtent - 300;

    if (scrollController.position.pixels >= threshold) {
      loadMoreNews();
    }
  }

  void _emitState(IHomePageState state) {
    value = state;
  }
}
