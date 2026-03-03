import 'package:news_hub/app/core/network/network_interface.dart';
import 'package:news_hub/app/core/network/network_result.dart';
import 'package:news_hub/app/data/models/news/news_model.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';

class UserContentsDatasource {
  final NetworkInterface network;

  UserContentsDatasource({required this.network});

  Future<List<NewsModel>> getUserContents({required UserContentsParamerters request}) async {
    final params = {'perPage': request.perPage.toString()};

    final response = await network.get<List<dynamic>>(
      url: 'contents/${request.userName}',
      parameters: params,
    );

    switch (response) {
      case Success(data: final data):
        return data.map((e) => NewsModel.fromMap(e)).toList();
      case Failure(networkException: final error):
        throw error;
    }
  }
}
