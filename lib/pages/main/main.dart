import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/api/apis.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/pages/main/channel_widget.dart';
import 'package:shop/pages/main/recommandWidget.dart';

import 'ad_widget.dart';
import 'categories_widget.dart';
import 'news_widget.dart';

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
    return _newsRecommend == null
        ? Container(
            height: setHeight(490.0),
            color: Colors.yellow,
          )
        : recommendWidget(_newsRecommend);
  }

  Widget _buildChannels() {
    return _channels == null
        ? Container(
            height: setHeight(137.0),
            color: Colors.red,
          )
        : newsChannelsWidget(
            channels: _channels,
          );
  }

  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: setHeight(161 * 5.0 + 100),
            color: Colors.green,
          )
        : Column(
            children: _newsPageList.items.map<Widget>((e) {
              List<Widget> widgets = <Widget>[
                newsWidget(newsItem: e),
                Divider(
                  height: 1,
                ),
              ];
              var index = _newsPageList.items.indexOf(e);
              if ((index % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1,),
                ]);
              }
              return Column(
                children: widgets,
              );
            }).toList(),
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
