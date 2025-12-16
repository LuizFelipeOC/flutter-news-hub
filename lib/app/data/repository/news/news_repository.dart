import 'dart:convert';

import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';

enum Categories { relevant, old, newContent }

class ContentRequestModel {
  final page = 1;
  final perPage = 10;
  final Categories strategy = Categories.newContent;
}

class NewsRepository {
  final IHttpClient httpClient;

  NewsRepository({required this.httpClient});

  Future<List<dynamic>> fetchContents({required ContentRequestModel requestModel}) async {
    String strategy = '';

    if (requestModel.strategy.name == Categories.newContent.name) {
      strategy = 'new';
    } else {
      strategy = requestModel.strategy.name;
    }

    Map<String, dynamic> queryParams = {
      'page': requestModel.page,
      'per_page': requestModel.perPage,
      'strategy': strategy,
    };

    final response = await httpClient.get(path: 'contents', queryParameters: queryParams);
    final dataDecoder = jsonDecode(response);
    final news = dataDecoder as List<dynamic>;

    return news;
  }
}
