import 'package:flutter/foundation.dart';
import 'package:news_hub/app/data/models/filter_model/categories_filter_model.dart';

class CategoriesFilterController {
  ValueNotifier<CategoriesFilterModel> selectedCategory = ValueNotifier(
    CategoriesFilterModel(id: 'new', name: 'Novos'),
  );

  List<CategoriesFilterModel> categories = [
    CategoriesFilterModel(id: 'new', name: 'Novos'),
    CategoriesFilterModel(id: 'relevant', name: 'Relevantes'),
    CategoriesFilterModel(id: 'old', name: 'Velhos'),
  ];
}
