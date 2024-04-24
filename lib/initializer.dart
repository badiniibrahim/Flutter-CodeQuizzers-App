import 'package:codequizzers/app/core/values/enums.dart';
import 'package:codequizzers/app/data/storage/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/values/environment.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initEnvironment();
      await _initStorage();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initEnvironment() async {
    // Load Environment variables
    await dotenv.load(fileName: Environment.fileName);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init(StorageContainer.UserData.name);
    Get.put(StorageService());
  }
}
