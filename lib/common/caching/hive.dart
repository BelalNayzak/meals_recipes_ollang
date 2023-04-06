import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

import '../constants/caching_keys.dart';

class HiveStorage {
  static HiveStorage? _singleton;

  factory HiveStorage() {
    _singleton = _singleton ?? HiveStorage._internal();
    return _singleton!;
  }

  HiveStorage._internal();

  Box? _box;
  Directory? securePath;
  Directory? publicPath;

  Future<void> createHive() async {
    securePath = await path.getApplicationDocumentsDirectory();
    publicPath = await path.getTemporaryDirectory();
    var directory = securePath;
    Hive.init(directory!.path);
    _box = await Hive.openBox(CachingKeys.BOX_NAME);
  }

  putInBox({required String key, required dynamic value}) {
    _box!.put(key, value);
  }

  getFromBox({required String key}) {
    return _box!.get(key, defaultValue: null);
  }

  removeFromBox({required String key}) {
    _box!.delete(key);
  }

  deleteBox() {
    Hive.deleteBoxFromDisk(CachingKeys.BOX_NAME);
  }

  deleteKeys({required List<String> keys}) {
    _box!.deleteAll(keys);
  }
}
