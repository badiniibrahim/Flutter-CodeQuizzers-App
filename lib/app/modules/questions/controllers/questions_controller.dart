import 'package:codequizzers/app/core/api/i_controller.dart';
import 'package:codequizzers/app/data/models/questions_model.dart';
import 'package:codequizzers/app/data/repository/questions_repository.dart';
import 'package:codequizzers/app/data/storage/storage_service.dart';
import 'package:codequizzers/app/modules/questions/state.dart';
import 'package:codequizzers/app/modules/score/views/score_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController with IController {
  final QuestionsState state = QuestionsState();
  final QuestionsRepository _repository = QuestionsRepository();
  late PageController pageController;

  QuestionsModel get currentQuestion =>
      state.questionList[state.currentIndex.value];

  @override
  Future<void> onInit() async {
    pageController = PageController(initialPage: state.currentIndex.value);
    await StorageService().userData.clearData();
    setArgumentsInState();
    getQuestions();
    super.onInit();
  }

  void setArgumentsInState() {
    dynamic arguments = Get.arguments;
    if (arguments == null) return;
    if (Get.arguments['categories'] != null) {
      state.categories = Get.arguments['categories'] as String;
      state.difficulty = Get.arguments['difficulty'] as String;
    }
  }

  Future<void> getQuestions() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response =
            await _repository.getQuestions(state.categories, state.difficulty);
        state.questionList = response;
        await StorageService().userData.saveQuestionLength(response.length);
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  Future<void> checkAnswer(String answer, bool isCorrect) async {
    state.selectedAnswer.value = answer;
    state.isAnswered.value = true;
    if (isCorrect) {
      state.score.value += 1;
      await StorageService().userData.saveScore(state.score.value);
    }
    state.hasAnswered.value = true;
    update();
  }

  void nextQuestion() {
    if (!state.isAnswered.value) return;

    if (state.hasAnswered.isTrue) {
      state.hasAnswered.value = false;
    }

    if (state.currentIndex.value != state.questionList.length - 1) {
      state.currentIndex.value++;
      pageController.animateToPage(
        state.currentIndex.value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
      state.isAnswered.value = false;
      state.selectedAnswer.value = '';
      update();
    } else {
      Get.to(() => const ScoreView());
    }
  }
}
