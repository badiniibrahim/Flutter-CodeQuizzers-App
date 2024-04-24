import 'package:codequizzers/app/modules/difficulty/controllers/difficulty_controller.dart';
import 'package:get/get.dart';

class DifficultyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DifficultyController>(
      () => DifficultyController(),
    );
  }
}
