import 'package:codequizzers/app/modules/score/controlllers/score_controller.dart';
import 'package:get/get.dart';

class ScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreController>(
      () => ScoreController(),
    );
  }
}
