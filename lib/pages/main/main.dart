import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:shop/api/apis.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/pages/main/channel_widget.dart';
import 'package:shop/pages/main/recommandWidget.dart';
import 'package:shop/util/index.dart';
import 'package:shop/widgets/app_bar.dart';

import 'ad_widget.dart';
import 'categories_widget.dart';
import 'news_letter_widget.dart';
import 'news_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller; // EasyRefresh控制器

  NewsPageListResponseEntity _newsPageList;
  NewsRecommendResponseEntity _newsRecommend;
  List<CategoryResponseEntity> _categories;
  List<ChannelResponseEntity> _channels;

  String _selCategoryCode;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAll();
    _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJson(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadNewsDataByCategoryCode({
    categoryCode,
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      refresh: refresh,
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    if (mounted) {
      setState(() {});
    }
  }

  _loadAll() async {
    _categories = await NewsAPI.categories(
      context: context,
    );
    _channels = await NewsAPI.channels(context: context);
    _newsRecommend = await NewsAPI.newsRecommend(context: context);
    _newsPageList = await NewsAPI.newsPageList(context: context);

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
                  Divider(
                    height: 1,
                  ),
                ]);
              }
              return Column(
                children: widgets,
              );
            }).toList(),
          );
  }

  Widget _buildEmailSubscribe() {
    return newsLetterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _newsPageList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishLoad: true,
            controller: _controller,
            header: ClassicalHeader(),
            onRefresh: () async {
              await _loadNewsDataByCategoryCode(
                categoryCode: _selCategoryCode,
                refresh: true,
              );
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCategories(),
                  _buildRecommand(),
                  _buildChannels(),
                  _buildNewsList(),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }
}
