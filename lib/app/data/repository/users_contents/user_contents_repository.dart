import 'dart:convert';

import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';

class UserContentsRepository {
  final IHttpClient httpClient;

  UserContentsRepository({required this.httpClient});

  Future<List<dynamic>> fetchUserContents({required UserContentsParamerters parameters}) async {
    try {
      final params = {'perPage': parameters.perPage.toString()};

      final response = await httpClient.get(
        path: 'contents/${parameters.userName}',
        queryParameters: params,
      );

      final decodeUserContents = jsonDecode(response);
      final userContents = decodeUserContents as List<dynamic>;
      final mappedUserContents = userContents.map((content) => NewsModel.fromMap(content)).toList();
      return mappedUserContents;
    } catch (e) {
      throw Exception('Failed to load user contents: $e');
    }
  }
}
