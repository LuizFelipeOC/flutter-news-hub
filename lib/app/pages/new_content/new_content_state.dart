import 'package:news_hub/app/data/models/news/news_model.dart';

abstract interface class INewContentState {}

class NewContentInitialState implements INewContentState {}

class NewContentLoadingState implements INewContentState {}

class NewContentLoadedState implements INewContentState {
  final NewsModel newsItem;

  NewContentLoadedState({required this.newsItem});
}

class NewContentErrorState implements INewContentState {
  final String message;

  NewContentErrorState({required this.message});
}
