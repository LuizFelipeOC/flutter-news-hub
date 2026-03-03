import 'package:flutter/material.dart';
import 'package:news_hub/app/core/network/network_exception.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';
import 'package:news_hub/app/data/repository/users_contents/user_contents_repository.dart';
import 'package:news_hub/app/pages/user_contents/user_contents_state.dart';

class UserContentsController extends ValueNotifier<UserContentsState> {
  final UserContentsRepository repository;

  UserContentsController({required this.repository}) : super(UserContentsInitialState());

  Future<void> loadUserContents({required UserContentsParamerters parameters}) async {
    try {
      _emitState(UserContentsLoadingState());

      final request = UserContentsParamerters(
        userName: parameters.userName,
        perPage: parameters.perPage,
      );

      final resultUserContents = await repository.fetchUserContents(parameters: request);
      _emitState(UserContentsSuccessState(contents: resultUserContents));
    } on NetworkException catch (error) {
      _emitState(UserContentsErrorState(message: error.message));
    } catch (error) {
      _emitState(
        UserContentsErrorState(
          message: 'Ocorreu um erro inesperado ao carregar os conteúdos do usuário.',
        ),
      );
    }
  }

  void _emitState(UserContentsState state) {
    value = state;
  }
}
