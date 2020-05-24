import 'package:localstorage/localstorage.dart';
import 'package:shop/config/index.dart';

class StorageUtil{
  static final _singleton = new StorageUtil._internal();

  LocalStorage localStorage;

  factory StorageUtil() {
    return _singleton;
  }

  StorageUtil._internal(){
    localStorage = new LocalStorage(STORAGE_MASTER_KEY);
  }

  String getItem(String key) {
    return localStorage.getItem(key);
  }

  Future<void> setItem(String key, String val) async {
    await localStorage.setItem(key, val);
  }
}