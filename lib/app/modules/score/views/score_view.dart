import 'package:codequizzers/app/core/utilies/colors.style.dart';
import 'package:codequizzers/app/core/utilies/pourcentage.dart';
import 'package:codequizzers/app/data/storage/storage_service.dart';
import 'package:codequizzers/app/modules/score/controlllers/score_controller.dart';
import 'package:codequizzers/app/routes/app_pages.dart';
import 'package:codequizzers/app/shared/widgets/back/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScoreView extends GetView<ScoreController> {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScoreController>(
      init: ScoreController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.c1,
          appBar: AppBar(
            title: const Text("Final score"),
            centerTitle: true,
            backgroundColor: AppColors.c1,
            leading: const CustomBackButton(),
          ),
          body: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(height: 20.0),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/trophee-sportif.png"),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    "Congrats!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "${percentage(controller.state.score, controller.state.questionLength)}% Score",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                      fontSize: 30,
                      color: AppColors.green1,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    "Quiz completed successfully",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'You attempted',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'muli',
                              fontWeight: FontWeight.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    " ${controller.state.questionLength} questions,",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: " out of which",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: " ${controller.state.score} answers",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' were correct',
                              )
                            ]),
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
                        onPressed: () async => {
                          await StorageService().userData.clearData(),
                          Get.offAllNamed(Routes.CATEGORIES)
                        },
                        child: Text(
                          'Back to Home'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
