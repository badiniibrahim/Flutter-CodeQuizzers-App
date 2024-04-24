import 'package:codequizzers/app/core/api/i_controller.dart';
import 'package:codequizzers/app/data/repository/categories_repository.dart';
import 'package:codequizzers/app/modules/categories/state.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController with IController {
  final CategoriesRepository _repository = CategoriesRepository();
  final CategoriesState state = CategoriesState();

  Future<void> fetCategoriesList() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.getCategories();
        state.categoriesList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
