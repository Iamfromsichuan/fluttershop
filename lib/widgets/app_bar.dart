import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:shop/config/index.dart';

Widget appBar({
  @required BuildContext context,
  List<Widget> actions,
  Widget title,
  Widget leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading ??
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: KColor.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    actions: actions,
  );
}

Widget cardListSkeleton() {
  return PKCardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: true,
    length: 10,
  );
}
