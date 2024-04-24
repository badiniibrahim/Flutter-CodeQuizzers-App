import 'package:codequizzers/app/modules/questions/controllers/questions_controller.dart';
import 'package:get/get.dart';

class QuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(
      () => QuestionsController(),
    );
  }
}
