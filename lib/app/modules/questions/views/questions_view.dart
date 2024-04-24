import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/questions/controllers/questions_controller.dart';
import 'package:codequizzers/app/modules/questions/widgets/questions_card.dart';
import 'package:codequizzers/app/shared/widgets/back/back_button.dart';
import 'package:codequizzers/app/shared/widgets/loader/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({super.key});
  // final ViewportController viewPortController = Get.find<ViewportController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      init: QuestionsController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.c1,
          appBar: AppBar(
            title: Text("Questions ${controller.state.categories}"),
            centerTitle: true,
            backgroundColor: AppColors.c1,
            leading: const CustomBackButton(),
          ),
          body: Obx(
            () => controller.state.isLoading
                ? const CircularProgress()
                : Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          onPageChanged: (index) {
                            controller.state.currentIndex.value = index;
                          },
                          itemCount: controller.state.questionList.length,
                          itemBuilder: (context, index) =>
                              SingleChildScrollView(
                            child: QuestionCard(
                              question: controller.state.questionList[index],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.green),
                            ),
                            onPressed: () => controller.nextQuestion(),
                            child: Text(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'muli',
                                color: AppColors.white,
                              ),
                              controller.state.currentIndex.value ==
                                      controller.state.questionList.length - 1
                                  ? 'Finish'.toUpperCase()
                                  : 'Next'.toUpperCase(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
