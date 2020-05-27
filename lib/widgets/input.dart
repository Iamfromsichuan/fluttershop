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
  return Container(
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

Widget inputEmailEdit({
  double marginTop = 19,
  keyboardType = TextInputType.emailAddress,
  hintText = 'Email',
  isPassword = false,
  @required TextEditingController controller,
  bool autoFocus = false,
}) {
  return Container(
    height: setHeight(44.0),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
        color: KColor.primaryBackground,
        borderRadius: Radii.k6pxRadius,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            offset: Offset(0, 1),
            blurRadius: 0,
          )
        ]),
    child: TextField(
      autocorrect: false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: KColor.primaryText,
        ),
      ),
      style: TextStyle(
        color: KColor.primaryText,
        fontFamily: KFont.Avenir,
        fontWeight: FontWeight.w400,
        fontSize: setFont(18),
      ),
      maxLines: 1,
      autofocus: autoFocus,
      obscureText: isPassword,
    ),
  );
}
