import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/core/utilies/get_color.dart';
import 'package:codequizzers/app/core/utilies/status.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String name;
  final String index;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;
  final Color color;

  const Item({
    super.key,
    required this.name,
    required this.index,
    required this.onTap,
    required this.isSelected,
    required this.isAnswered,
    required this.isCorrect,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          color: getColor(isCorrect, isSelected, color),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.only(left: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: AppColors.c1,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Center(
                child: getStatus(
                    isAnswered, isSelected, isCorrect, index.toUpperCase()),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 260,
              child: Text(
                name.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'muli',
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
