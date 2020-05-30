// import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:shop/config/index.dart';
import 'package:shop/global.dart';
import 'package:shop/util/index.dart';

Future<bool> isAuthenticated() async {
  var profileJson = StorageUtil().getJson(STORE_USER_PROFILE_KEY);
  return profileJson != null ? true : false;
}

Future deleteAuthentication() async {
  await StorageUtil().remove(STORE_USER_PROFILE_KEY);
  Global.profile = null;
}

Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(context, "/sign_in", (route) => false);
}
