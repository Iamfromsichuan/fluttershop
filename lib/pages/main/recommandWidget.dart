import 'package:flutter/cupertino.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/widgets/image.dart';

Widget recommandWidget({
  NewsRecommendResponseEntity newsRecommend,
}) {
  return Container(
    margin: EdgeInsets.all(setWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageCached(
          newsRecommend.thumbnail,
          width: setWidth(335),
          height: setHeight(290),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(14)),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
              fontFamily: KFont.Avenir,
              fontWeight: FontWeight.normal,
              color: KColor.thirdElementText,
              fontSize: setFont(14),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(14)),
          child: Text(
            newsRecommend.title,
            
          ),
        )
      ],
    ),
  );
}
