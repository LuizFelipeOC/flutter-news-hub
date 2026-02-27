import 'package:news_hub/app/core/enums/news_enums/categories_enum.dart';

class NewsRequestModel {
  int page;
  int perPage;
  CategoriesEnum strategy;

  NewsRequestModel({this.page = 1, this.perPage = 10, this.strategy = CategoriesEnum.newContent});
}
