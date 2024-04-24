import 'package:get/get_rx/get_rx.dart';

class DifficultyState {
  final _categories = ''.obs;
  String get categories => _categories.value;
  set categories(String value) => _categories.value = value;
}
