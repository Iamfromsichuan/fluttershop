import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/provide/provider.dart';
import 'package:shop/util/index.dart';

import 'config/index.dart';
import 'entity/entity.dart';

class Global {
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: null,
  );

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static bool isOfflinelogin = false;
  static bool isFirstOpen = false;

  static AppState appState = AppState();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageUtil.init();
    HttpUtil();

    try {
      isFirstOpen = StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
      if (isFirstOpen) {
        StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
      }
    } catch (e) {
      print(e);
    }

    var _profileJson = StorageUtil().getJson(STORE_USER_PROFILE_KEY);
    if (_profileJson != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJson);
      isOfflinelogin = true;
    }

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<bool> saveProfile(
      UserLoginResponseEntity userLoginResponseEntity) {
    profile = userLoginResponseEntity;
    return StorageUtil()
        .setJson(STORE_USER_PROFILE_KEY, userLoginResponseEntity.toJson());
  }
}
