import 'package:codequizzers/app/data/storage/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

abstract class IStorage {
  @protected
  late GetStorage box;

  /// use this [read] to read the data stored in local storage
  T? read<T>(StorageKey key, [T Function(Map<String, dynamic> e)? creator]) {
    if (!box.hasData(key.name)) return null;

    final readVal = box.read(key.name);

    return (creator != null) ? creator(readVal) : readVal;
  }

  /// use this [write] to save the data to local storage
  Future<bool> write(StorageKey key, dynamic value) async {
    final writeVal = value;

    await box.write(key.name, writeVal);

    return true;
  }

  /// use this [remove] to remove data from local storage
  Future<void> remove(StorageKey key) async {
    if (box.hasData(key.name)) await box.remove(key.name);
  }

  /// use this [erase] to remove data from local storage
  void erase() async {
    box.erase();
  }
}
