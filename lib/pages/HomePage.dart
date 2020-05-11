import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';
import 'package:shop/service/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text(KString.homeTitle),
      ),
      body: FutureBuilder(
        future: request("homePageContext", formData: null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data.toString());
            print(data);

            List<Map> swiperDataList = (data["data"]["slides"] as List).cast();
            List<Map> categoryList = (data["data"]["category"] as List).cast();
            List<Map> recommendList = (data["data"]["recommend"] as List).cast();
            List<Map> floor1 = (data["data"]["floor1"] as List).cast();
            Map fp1 = data["data"]['floor1Pic'];
            return Container(
              child: Text("123123"),
            );
          }
          return Container(
            child: Text("数据加载中"),
          );
        },
      ),
    );
  }
}
