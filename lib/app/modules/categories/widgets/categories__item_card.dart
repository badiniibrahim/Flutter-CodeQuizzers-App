import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/modules/difficulty/views/difficulty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesItemCard extends StatelessWidget {
  final String name;
  final int id;

  const CategoriesItemCard({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Get.to(() => DifficultyView(), arguments: {"categories": name});
        },
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            child: Center(
              child: Text(
                name.toUpperCase(),
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
