import 'package:codequizzers/app/data/models/categories_model.dart';
import 'package:codequizzers/app/data/providers/categories_provider.dart';
import 'package:codequizzers/app/data/repository/i_repository.dart';
import 'package:dio/dio.dart';

class CategoriesRepository extends IRepository<Response> {
  @override
  CategoriesProvider get provider => CategoriesProvider();

  Future<List<CategoriesModel>> getCategories() async {
    final response = await provider.getCategories();
    var categories = response.data as List;
    List<CategoriesModel> categoriesList =
        categories.map((m) => CategoriesModel.fromJson(m)).toList();
    return categoriesList;
  }
}
