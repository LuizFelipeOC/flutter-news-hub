import 'package:news_hub/app/data/models/news/news_model.dart';

abstract interface class UserContentsState {}

class UserContentsInitialState implements UserContentsState {}

class UserContentsLoadingState implements UserContentsState {}

class UserContentsSuccessState implements UserContentsState {
  final List<NewsModel> contents;

  UserContentsSuccessState({required this.contents});
}

class UserContentsErrorState implements UserContentsState {
  final String message;

  UserContentsErrorState({required this.message});
}
