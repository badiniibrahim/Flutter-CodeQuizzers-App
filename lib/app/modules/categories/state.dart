import 'package:codequizzers/app/data/models/categories_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CategoriesState {
  final RxBool _isLoading = RxBool(true);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<CategoriesModel> _categoriesList = <CategoriesModel>[].obs;
  set categoriesList(value) => _categoriesList.value = value;
  List<CategoriesModel> get categoriesList => _categoriesList;
}
