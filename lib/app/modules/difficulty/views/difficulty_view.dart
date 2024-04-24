import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/difficulty/controllers/difficulty_controller.dart';
import 'package:codequizzers/app/modules/difficulty/widgets/difficulty_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DifficultyView extends GetView<DifficultyController> {
  DifficultyView({
    super.key,
  });

  final difficulty = ["easy", "medium", "hard"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DifficultyController>(
      init: DifficultyController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.c1,
          appBar: AppBar(
            title: const Text("Difficulty"),
            centerTitle: true,
            backgroundColor: AppColors.c1,
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            padding: const EdgeInsets.all(10.0),
            itemCount: 3,
            itemBuilder: (context, index) {
              final value = difficulty[index];
              return DifficultyItemCard(
                difficulty: value,
                categories: controller.state.categories,
              );
            },
          ),
        );
      },
    );
  }
}
