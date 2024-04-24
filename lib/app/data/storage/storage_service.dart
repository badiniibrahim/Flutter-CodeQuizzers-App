import 'package:codequizzers/app/data/storage/user_data_storage.dart';

class StorageService {
  late UserDataStorage userData;

  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal() {
    userData = UserDataStorage();
  }
}
