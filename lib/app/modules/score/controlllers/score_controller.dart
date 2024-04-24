import 'package:codequizzers/app/data/storage/storage_service.dart';
import 'package:codequizzers/app/modules/score/state.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController {
  final ScoreState state = ScoreState();

  @override
  Future<void> onInit() async {
    state.score = StorageService().userData.score ?? 0;
    state.questionLength = StorageService().userData.questionLength ?? 0;
    super.onInit();
  }
}
