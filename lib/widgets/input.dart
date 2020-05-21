import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/config/index.dart';

Widget Input({
  @required TextEditingController controller,
  double marginTop = 15.0,
  TextInputType keyboardKey = TextInputType.text,
  String hintText,
  bool isPassword = false,
}) {
  return  Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
      color: KColor.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardKey,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: KColor.primaryText,
        fontFamily: KFont.Avenir,
        fontWeight: FontWeight.w400,
        fontSize: setFont(18),
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}
