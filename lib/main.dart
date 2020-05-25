import 'package:flutter/material.dart';
import 'package:shop/global.dart';
import 'package:shop/pages/welcome.dart';
import 'package:shop/router.dart';
import './config/index.dart';

void main() {
//  var currentIndexProvide = CurrentIndexProvide();
//  var provides = Providers();
//
//  provides..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
//  runApp(ProviderNode(child: MyApp(), providers: provides,));
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: KString.mainTitle, // 标题
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
        ),
        routes: staticRoutes,
        // inheritWidget 后面深入学习
         home: WelcomePage(),
      ),
    );
  }
}
