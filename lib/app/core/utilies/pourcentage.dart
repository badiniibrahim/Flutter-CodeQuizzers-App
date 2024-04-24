String percentage(int correctAnswers, int totalQuestions) {
  double percentage = (correctAnswers / totalQuestions) * 100;
  String percentageText = percentage == percentage.toInt()
      ? percentage.toInt().toString()
      : percentage.toStringAsFixed(1);
  return percentageText;
}
