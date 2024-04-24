import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/viewport_controllers.dart';

// ignore: must_be_immutable
class StepProgressView extends StatelessWidget {
  final stepsArray = 8;
  Color activeColor = AppColors.white;
  Color inactiveColor = AppColors.white;
  TextStyle headerStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  StepProgressView({
    super.key,
    required this.padding,
    required this.pageViewController,
  });

  final EdgeInsets padding;
  final ViewportController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.white,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          ("${"Step".toUpperCase()} ${pageViewController.currentIndexPage.value + 1}")
                              .toString(),
                      style: headerStyle.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: " / $stepsArray",
                      style: headerStyle.copyWith(
                        color: pageViewController.currentIndexPage.value ==
                                stepsArray
                            ? AppColors.primary
                            : AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
