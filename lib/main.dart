import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:shop/pages/index_page.dart';
import 'package:shop/pages/welcome.dart';
import './config/index.dart';
import './provide/current_index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var provides = Providers();

  provides..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(), providers: provides,));
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
        // inheritWidget 后面深入学习
         home: WelcomePage(),
      ),
    );
  }
}
