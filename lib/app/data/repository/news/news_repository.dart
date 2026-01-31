import 'dart:convert';

import 'package:news_hub/app/core/enums/news_enums/categories_enum.dart';
import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:news_hub/app/data/models/contents/content_request_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';

class NewsRepository {
  final IHttpClient httpClient;

  NewsRepository({required this.httpClient});

  Future<List<NewsModel>> fetchContents({
    required ContentRequestModel requestModel,
  }) async {
    String strategy = '';

    if (requestModel.strategy.name == CategoriesEnum.newContent.name) {
      strategy = 'new';
    } else {
      strategy = requestModel.strategy.name;
    }

    Map<String, dynamic> queryParams = {
      'page': requestModel.page.toString(),
      'per_page': requestModel.perPage.toString(),
      'strategy': strategy,
    };

    final response = await httpClient.get(
      path: 'contents',
      queryParameters: queryParams,
    );
    final dataDecoder = jsonDecode(response);
    final news = dataDecoder as List<dynamic>;
    final newsMapped = news
        .map((e) => NewsModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return newsMapped;
  }

  Future<NewsModel> fetchContentById({
    required String slug,
    required String userId,
  }) async {
    Map<String, dynamic> queryParams = {'username': userId, 'slug': slug};

    final response = await httpClient.get(
      path: 'contents/$userId/$slug',
      queryParameters: queryParams,
    );

    final dataDecoder = jsonDecode(response);
    return NewsModel.fromMap(dataDecoder as Map<String, dynamic>);
  }
}
