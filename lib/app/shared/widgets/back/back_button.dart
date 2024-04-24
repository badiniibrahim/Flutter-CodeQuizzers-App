import 'dart:io';

import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/data/storage/storage_service.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await StorageService().userData.clearData();
        Get.offAllNamed(Routes.CATEGORIES);
      },
      child: Platform.isIOS
          ? const Icon(
              FluentIcons.ios_arrow_ltr_24_filled,
              color: AppColors.black,
            )
          : const Icon(
              FluentIcons.arrow_left_24_regular,
              color: AppColors.black,
            ),
    );
  }
}
