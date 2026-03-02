import 'dart:convert';

import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:news_hub/app/data/datasources/news_datasources/news_datasource.dart';
import 'package:news_hub/app/data/models/news/new_request_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';

class NewsRepository {
  final IHttpClient httpClient;
  final NewsDatasource newsDatasources;

  NewsRepository({required this.httpClient, required this.newsDatasources});

  Future<List<NewsModel>> getNews({required NewsRequestModel request}) async {
    return await newsDatasources.getNews(request: request);
  }

  Future<NewsModel> fetchContentById({required String slug, required String userId}) async {
    Map<String, dynamic> queryParams = {'username': userId, 'slug': slug};

    final response = await httpClient.get(
      path: 'contents/$userId/$slug',
      queryParameters: queryParams,
    );

    final dataDecoder = jsonDecode(response);
    return NewsModel.fromMap(dataDecoder as Map<String, dynamic>);
  }
}
