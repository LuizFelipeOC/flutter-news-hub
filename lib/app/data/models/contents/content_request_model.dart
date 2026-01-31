import 'package:news_hub/app/core/enums/news_enums/categories_enum.dart';

class ContentRequestModel {
  final page = 1;
  final perPage = 10;
  final CategoriesEnum strategy = CategoriesEnum.newContent;
}
