import 'package:flutter/cupertino.dart';
import 'package:shop/config/index.dart';

Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: setHeight(100.0),
    padding: EdgeInsets.all(setWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(Borders.primaryBorder),
        borderRadius: Radii.k6pxRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Third of Ads? Get Premium - \$9.99",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KColor.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: setFont(18),
              // height: 1,
            ),
          )
        ],
      ),
    ),
  );
}
