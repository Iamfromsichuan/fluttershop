import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/pages/application/application.dart';
import 'package:shop/pages/sign_in/sign_in.dart';
import 'package:shop/pages/welcome.dart';

import '../../global.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    print("======================>>>>>>>==================");
    print(Global.isFirstOpen);
    return Scaffold(
      body: Global.isFirstOpen != true
          ? WelcomePage()
          : Global.isOfflinelogin ? ApplicationPage() : SignIn(),
    );
  }
}
