String extractCorrectAnswer(String parameter) {
  if (parameter == 'answer_a') {
    return 'a';
  } else if (parameter == 'answer_b') {
    return 'b';
  } else if (parameter == 'answer_c') {
    return 'c';
  } else if (parameter == 'answer_d') {
    return 'd';
  } else if (parameter == 'answer_e') {
    return 'e';
  } else if (parameter == 'answer_f') {
    return 'f';
  } else {
    return 'Invalid input';
  }
}
