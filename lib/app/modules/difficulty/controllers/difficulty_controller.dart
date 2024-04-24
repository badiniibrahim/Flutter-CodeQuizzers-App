import 'package:codequizzers/app/modules/difficulty/state.dart';
import 'package:get/get.dart';

class DifficultyController extends GetxController {
  final DifficultyState state = DifficultyState();

  @override
  void onInit() {
    setArgumentsInState();
    super.onInit();
  }

  void setArgumentsInState() {
    dynamic arguments = Get.arguments;
    if (arguments == null) return;
    if (Get.arguments['categories'] != null) {
      state.categories = Get.arguments['categories'] as String;
    }
  }
}
