import 'package:codequizzers/app/data/models/questions_model.dart';
import 'package:get/get_rx/get_rx.dart';

class QuestionsState {
  final RxBool _isLoading = RxBool(true);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final _categories = ''.obs;
  String get categories => _categories.value;
  set categories(String value) => _categories.value = value;

  final _difficulty = ''.obs;
  String get difficulty => _difficulty.value;
  set difficulty(String value) => _difficulty.value = value;

  final RxList<QuestionsModel> _questionList = <QuestionsModel>[].obs;
  set questionList(value) => _questionList.value = value;
  List<QuestionsModel> get questionList => _questionList;

  var currentIndex = 0.obs;
  var selectedAnswer = ''.obs;
  var isAnswered = false.obs;
  RxInt score = 0.obs;
  RxBool hasAnswered = false.obs;
}
