import 'package:flutter/material.dart';
import 'package:news_hub/app/core/widgets/categories_filter/categories_filter_controller.dart';

import 'package:news_hub/app/data/models/filter_model/categories_filter_model.dart';

class CategoriesFilter extends StatefulWidget {
  final ValueChanged<CategoriesFilterModel>? onCategorySelected;

  const CategoriesFilter({super.key, required this.onCategorySelected});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  final CategoriesFilterController controller = CategoriesFilterController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        final category = controller.categories[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ValueListenableBuilder<CategoriesFilterModel>(
            valueListenable: controller.selectedCategory,
            builder: (context, selectedCategory, child) {
              return ChoiceChip(
                label: Text(category.name),
                selected: selectedCategory.id == category.id,
                onSelected: (selected) {
                  controller.selectedCategory.value = category;
                  widget.onCategorySelected?.call(category);
                },
              );
            },
          ),
        );
      },
    );
  }
}
