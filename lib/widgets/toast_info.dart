import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/config/index.dart';

Future<bool> toastInfo({
  @required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: backgroundColor,
    gravity: ToastGravity.TOP,
    timeInSecForIos: 1,
    textColor: textColor,
    fontSize: setFont(16),
    toastLength: Toast.LENGTH_SHORT,
  );
}
