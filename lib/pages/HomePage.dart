import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop/config/index.dart';
import 'package:shop/service/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    print("-----------------");
  }

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
            print(categoryList);
            List<Map> recommendList =
                (data["data"]["recommend"] as List).cast();
            List<Map> floor1 = (data["data"]["floor1"] as List).cast();
            Map fp1 = data["data"]['floor1Pic'];
            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: KColor.refreshColor,
                moreInfoColor: KColor.refreshColor,
                noMoreText: "",
                moreInfo: KString.moreInfo,
                loadReadyText: KString.loadReadyText,
              ),
              child: ListView(
                children: [
                  SwiperDiy(swiperDataList: swiperDataList),
                  TopNavigator(category: categoryList),
                  RecommendListUI(
                    recommendList: recommendList,
                  ),
                  FloorPicUI(floorPic: fp1,),
                ],
              ),
              loadMore: () async {
                print("正在加载");
              },
            );
          }
          return Center(
            child: Text('加载中'),
          );
        },
      ),
    );
  }
}

class FloorPicUI extends StatelessWidget {
  final Map floorPic;

  FloorPicUI({Key key, this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      height: ScreenUtil().setHeight(200),
      child: InkWell(
        child: Image.network(
          floorPic["PICTRUE_ADDRESS"],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              "${swiperDataList[index]["image"]}",
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class TopNavigator extends StatelessWidget {
  final List category;

  TopNavigator({Key key, this.category}) : super(key: key);

  Widget _gridViewItem(BuildContext context, item, index) {
    var icon;
    if (item["image"] != "") {
      icon = Image.network(item["image"], width: ScreenUtil().setWidth(95));
    } else {
      icon = Icon(
        Icons.accessibility_new,
        size: ScreenUtil().setWidth(85),
      );
    }

    return InkWell(
      onTap: () {},
      child: Column(
        children: [icon, Text(item["firstCategoryName"])],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (category.length > 10) {
      category.removeRange(10, category.length - 1);
    }

    var tempIndex = -1;

    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.all(3.0),
        height: ScreenUtil().setHeight(320),
        width: ScreenUtil().setWidth(750),
        child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(4.0),
          physics: NeverScrollableScrollPhysics(),
          children: category.map((e) {
            tempIndex++;
            return _gridViewItem(context, e, tempIndex);
          }).toList(),
        ));
  }
}

class RecommendListUI extends StatelessWidget {
  final List recommendList;

  RecommendListUI({Key key, this.recommendList}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:
                  BorderSide(width: 0.5, color: KColor.defaultBorderColor))),
      child: Text(
        KString.recommend,
        style: TextStyle(
          color: KColor.homeSubTitleColor,
        ),
      ),
    );
  }

  Widget _recommendList(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(280),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendList.length,
            itemBuilder: (context, index) {
              return _item(context, index);
            }));
  }

  Widget _item(context, index) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(280),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(width: 5.0, color: KColor.defaultBorderColor)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                recommendList[index]["image"],
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              "¥${recommendList[index]["presentPrice"]}",
              style: TextStyle(color: KColor.presentPriceColor),
            ),
            Text(
              "¥${recommendList[index]["oriPrice"]}",
              style: KFont.oriPriceStyle,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _titleWidget(),
          _recommendList(context),
        ],
      ),
    );
  }
}

class Floor extends StatelessWidget{

  final Map floor;

  Floor({ Key key, this.floor }): super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil.screenWidth;
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [],
            ),
          ),
          Expanded(
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }

}
