import 'package:news_hub/app/core/network/network_interface.dart';
import 'package:news_hub/app/core/network/network_result.dart';
import 'package:news_hub/app/data/models/news/new_request_model.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';

class NewsDatasources {
  final NetworkInterface network;

  const NewsDatasources({required this.network});

  Future<List<NewsModel>> getNews({required NewsRequestModel request}) async {
    final result = await network.get<List<Map<String, dynamic>>>(
      url: 'contents',
      parameters: {
        'page': request.page.toString(),
        'per_page': request.perPage.toString(),
        'strategy': request.strategy.name,
      },
    );

    switch (result) {
      case Success(data: final data):
        final news = data.map((value) => NewsModel.fromMap(value)).toList();
        return news;
      case Failure(networkException: final error):
        throw error;
    }
  }
}
