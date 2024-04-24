import 'package:codequizzers/app/data/storage/enums.dart';
import 'package:codequizzers/app/data/storage/i_storage.dart';
import 'package:get_storage/get_storage.dart';

class UserDataStorage extends IStorage {
  static final UserDataStorage _singleton = UserDataStorage._internal();

  factory UserDataStorage() {
    return _singleton;
  }

  UserDataStorage._internal() {
    box = GetStorage(StorageContainer.UserData.name);
  }

  set score(int? value) => write(StorageKey.score, value);
  int? get score => read<int>(StorageKey.score);

  set questionLength(int? value) => write(StorageKey.questionLength, value);
  int? get questionLength => read<int>(StorageKey.questionLength);

  Future<bool> saveScore(int? score) => write(StorageKey.score, score);

  Future<bool> saveQuestionLength(int? length) =>
      write(StorageKey.questionLength, length);

  Future<void> clearData() async {
    await remove(StorageKey.score);
    await remove(StorageKey.questionLength);
  }
}
