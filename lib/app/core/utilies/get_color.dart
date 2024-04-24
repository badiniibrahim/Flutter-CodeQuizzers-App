import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:flutter/material.dart';

Color getColor(bool isCorrect, bool isSelected, Color color) {
  if (isCorrect && isSelected) {
    return color;
  } else if (!isCorrect && isSelected) {
    return AppColors.red1;
  }
  return AppColors.white;
}
