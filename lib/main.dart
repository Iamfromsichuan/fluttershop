import 'package:flutter/material.dart';
import './config/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.homeTitle, // 标题
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColor.primaryColor,
      ),
       home: ,
    );
  }
}
