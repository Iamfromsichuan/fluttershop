import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/widgets/widgets.dart';

Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    margin: EdgeInsets.all(setWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        imageCached(
          newsRecommend.thumbnail,
          width: setWidth(335),
          height: setHeight(290),
        ),
        // 作者
        Container(
          margin: EdgeInsets.only(top: setHeight(14)),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: KColor.thirdElementText,
              fontSize: setFont(14),
            ),
          ),
        ),
        // 标题
        Container(
          margin: EdgeInsets.only(top: setHeight(10)),
          child: Text(
            newsRecommend.title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: KColor.primaryText,
              fontSize: setFont(24),
              height: 1,
            ),
          ),
        ),
        // 一行 3 列
        Container(
          margin: EdgeInsets.only(top: setHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  newsRecommend.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: KColor.secondaryElementText,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 添加时间
              Container(
                width: setWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  // ${duTimeLineFormat(newsRecommend.addtime)}
                  '• 一分钟前',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: KColor.thirdElementText,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: KColor.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
