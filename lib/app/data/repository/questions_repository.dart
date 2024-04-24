import 'package:codequizzers/app/data/models/questions_model.dart';
import 'package:codequizzers/app/data/providers/questions_provider.dart';
import 'package:codequizzers/app/data/repository/i_repository.dart';
import 'package:dio/dio.dart';

class QuestionsRepository extends IRepository<Response> {
  @override
  QuestionsProvider get provider => QuestionsProvider();

  Future<List<QuestionsModel>> getQuestions(
      String category, String difficulty) async {
    final response = await provider.getQuestions(category, difficulty);
    var categories = response.data as List;
    List<QuestionsModel> categoriesList =
        categories.map((m) => QuestionsModel.fromJson(m)).toList();
    return categoriesList;
  }
}
