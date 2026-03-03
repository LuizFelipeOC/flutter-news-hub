import 'package:news_hub/app/data/datasources/news_datasources/news_datasource.dart';
import 'package:news_hub/app/data/models/news/new_detail_request_model.dart';
import 'package:news_hub/app/data/models/news/new_request_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';

class NewsRepository {
  final NewsDatasource newsDatasources;

  NewsRepository({required this.newsDatasources});

  Future<List<NewsModel>> getNews({required NewsRequestModel request}) async {
    return await newsDatasources.getNews(request: request);
  }

  Future<NewsModel> fetchContentById({required String slug, required String userId}) async {
    return await newsDatasources.getNewsById(
      request: NewDetailRequestModel(username: userId, slug: slug),
    );
  }
}
