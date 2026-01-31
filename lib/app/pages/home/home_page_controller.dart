import 'package:flutter/widgets.dart';
import 'package:news_hub/app/data/models/contents/content_request_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/pages/home/home_page_state.dart';

class HomePageController extends ValueNotifier<IHomePageState> {
  final NewsRepository newsRepository;

  HomePageController({required this.newsRepository})
    : super(HomePageInitialState());

  List<NewsModel> news = [];

  Future<void> loadNews() async {
    try {
      _emitState(HomePageLoadingState());

      final contents = await newsRepository.fetchContents(
        requestModel: ContentRequestModel(),
      );

      if (contents.isEmpty) {
        _emitState(HomePageEmptyState());
        return;
      }

      news = contents;
      _emitState(HomePageLoadedState(news: news));
    } catch (e) {
      _emitState(HomePageErrorState(message: 'Erro ao carregar notícias.'));
    }
  }

  void _emitState(IHomePageState state) {
    value = state;
  }
}
