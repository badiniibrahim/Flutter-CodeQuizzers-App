import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/questions/views/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DifficultyItemCard extends StatelessWidget {
  final String difficulty;
  final String categories;

  const DifficultyItemCard({
    super.key,
    required this.difficulty,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Get.to(() => QuestionsView(), arguments: {
            "categories": categories,
            "difficulty": difficulty,
          });
        },
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            child: Center(
              child: Text(
                difficulty.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
