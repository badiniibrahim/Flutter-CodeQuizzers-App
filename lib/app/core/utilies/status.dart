import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

Widget getStatus(
  bool isAnswered,
  bool isSelected,
  bool isCorrect,
  String name,
) {
  if (isCorrect && isSelected) {
    return const Icon(
      FluentIcons.checkmark_20_regular,
      color: AppColors.green1,
    );
  } else if (!isCorrect && isSelected) {
    return const Icon(
      FluentIcons.dismiss_24_regular,
      color: AppColors.red1,
    );
  }
  return Text(name);
}
