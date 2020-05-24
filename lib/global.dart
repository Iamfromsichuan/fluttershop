import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/util/http_util.dart';
import 'package:shop/util/storage.dart';

import 'config/storage.dart';
import 'entity/entity.dart';

class Global {
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: null,
  );

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageUtil.init();
    HttpUtil();

    var _profileJson = StorageUtil().getJson(STORE_USER_PROFILE_KEY);
    if (_profileJson != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJson);
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
