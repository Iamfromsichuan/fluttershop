import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/button.dart';
import 'package:shop/widgets/widgets.dart';

Widget newsLetterWidget() {
  return Container(
    margin: EdgeInsets.all(setWidth(20.0)),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "NewsLetter",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: KColor.thirdElementText,
                fontFamily: KFont.Montserrat,
                fontWeight: FontWeight.w600,
                fontSize: setFont(18),
                // height: 1,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.close,
                color: KColor.thirdElementText,
                size: setFont(17.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
        inputEmailEdit(
          marginTop: 19,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email',
          isPassword: false,
          controller: null,
          autoFocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: setHeight(15.0)),
          child: btnFlatButtonWidget(
            onPressed: () {},
            width: setWidth(335.0),
            height: setWidth(44.0),
            fontWeight: FontWeight.w600,
            title: "Subscribe",
          ),
        )
      ],
    ),
  );
}
