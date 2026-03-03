import 'package:news_hub/app/data/datasources/user_contents_datasource/user_contents_datasource.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';

class UserContentsRepository {
  final UserContentsDatasource datasource;

  UserContentsRepository({required this.datasource});

  Future<List<dynamic>> fetchUserContents({required UserContentsParamerters parameters}) async {
    return await datasource.getUserContents(request: parameters);
  }
}
