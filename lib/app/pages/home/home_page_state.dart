import 'package:news_hub/app/data/models/news/news_model.dart';

abstract interface class IHomePageState {}

class HomePageInitialState implements IHomePageState {}

class HomePageLoadingState implements IHomePageState {}

class HomePageLoadedState implements IHomePageState {
  final List<NewsModel> news;

  HomePageLoadedState({required this.news});
}

class HomePageErrorState implements IHomePageState {
  final String message;

  HomePageErrorState({required this.message});
}

class HomePageEmptyState implements IHomePageState {}
