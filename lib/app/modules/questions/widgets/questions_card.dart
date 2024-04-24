import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/questions/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codequizzers/app/data/models/questions_model.dart';
import 'package:codequizzers/app/modules/questions/controllers/questions_controller.dart';

class QuestionCard extends StatelessWidget {
  final QuestionsModel question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionsController controller = Get.find();
    return Obx(
      () => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              question.question!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
                color: AppColors.black,
              ),
            ),
          ),
          ...question.answers!.entries.map(
            (entry) {
              bool isCorrect =
                  question.correctAnswers!['${entry.key}_correct'] == true;
              if (isCorrect) {}
              bool isSelected =
                  entry.key == controller.state.selectedAnswer.value;
              Color borderColor = Colors.transparent;
              if (controller.state.isAnswered.isTrue && isSelected) {
                borderColor = isCorrect ? Colors.green : Colors.red;
              }
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Visibility(
                  visible: entry.value != null,
                  child: Item(
                    name: entry.value ?? "",
                    index: entry.key.substring(7, 8).toUpperCase(),
                    onTap: () {
                      if (!controller.state.isAnswered.isTrue) {
                        controller.checkAnswer(entry.key, isCorrect);
                      }
                    },
                    isSelected: isSelected,
                    isAnswered: controller.state.isAnswered.isTrue,
                    isCorrect:
                        question.correctAnswers!['${entry.key}_correct']!,
                    color: borderColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
