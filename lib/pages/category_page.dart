import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/model/category_model.dart';
import 'package:shop/service/http_service.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: [
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0;

  @override
  void initState() {
    super.initState();
    _getNavData();
    print("-------------------46--------------------");
  }

  void _getNavData() async {
    await request("getCategory", formData: null).then((value) {
      var data = json.decode(value.toString());
      print("-------------- 81");
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      print(data);
      setState(() {
        list = categoryModel.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('左侧分了');
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Text('右侧分了');
  }
}

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  Widget build(BuildContext context) {
    return Text('右侧分了');
  }
}
