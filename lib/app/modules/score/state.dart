import 'package:get/get_rx/get_rx.dart';

class ScoreState {
  final _score = 0.obs;
  int get score => _score.value;
  set score(int value) => _score.value = value;

  final _questionLength = 0.obs;
  int get questionLength => _questionLength.value;
  set questionLength(int value) => _questionLength.value = value;
}
