import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/api/apis.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';

import 'categories_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList;
  NewsRecommendResponseEntity _newsRecommend;
  List<CategoryResponseEntity> _categories;
  List<ChannelResponseEntity> _channels;

  String _selCategoryCode;

  @override
  void initState() {
    super.initState();
    _loaddAll();
  }

  void _loaddAll() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode = _categories.first.code;
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildCategories() {
    return newsCategoriesWidget(
        categories: _categories,
        selCategoryCode: _selCategoryCode,
        onTap: (CategoryResponseEntity item) {
          setState(() {
            _selCategoryCode = item.code;
          });
        });
  }

  Widget _buildRecommand() {
    return Container(
      height: setHeight(490.0),
      color: Colors.yellow,
    );
  }

  Widget _buildChannels() {
    return Container(
      height: setHeight(137.0),
      color: Colors.red,
    );
  }

  Widget _buildNewsList() {
    return Container(
      height: setHeight(161 * 5.0 + 100),
      color: Colors.green,
    );
  }

  Widget _buildEmailSubscribe() {
    return Container(
      height: setHeight(259.0),
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommand(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
