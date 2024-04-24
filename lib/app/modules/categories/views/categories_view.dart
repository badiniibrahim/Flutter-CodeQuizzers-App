import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/categories/controllers/categories_controller.dart';
import 'package:codequizzers/app/modules/categories/widgets/categories__item_card.dart';
import 'package:codequizzers/app/shared/widgets/loader/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      init: CategoriesController(),
      initState: (_) {
        controller.fetCategoriesList();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.c1,
          appBar: AppBar(
            title: const Text("Categories"),
            centerTitle: true,
            backgroundColor: AppColors.c1,
          ),
          body: Obx(
            () => controller.state.isLoading
                ? const CircularProgress()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    itemCount: controller.state.categoriesList.length,
                    itemBuilder: (context, index) {
                      final categories = controller.state.categoriesList[index];
                      return CategoriesItemCard(
                        id: categories.id ?? -1,
                        name: categories.name ?? "",
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
