import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/widgets/image.dart';

Widget newsWidget({
  NewsItem newsItem,
}) {
  return Container(
    height: setHeight(161),
    padding: EdgeInsets.all(setWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageCached(
          newsItem.thumbnail,
          width: setWidth(121),
          height: setWidth(121),
        ),
        SizedBox(
          width: setWidth(194),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  newsItem.author,
                  style: TextStyle(
                    color: KColor.thirdElementText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(10.0)),
                child: Text(
                  newsItem.title,
                  style: TextStyle(
                    color: KColor.primaryText,
                    fontFamily: KFont.Montserrat,
                    fontWeight: FontWeight.w500,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: setWidth(60),
                      ),
                      child: Text(
                        newsItem.category,
                        style: TextStyle(
                          color: KColor.secondaryElementText,
                          fontFamily: KFont.Avenir,
                          fontWeight: FontWeight.normal,
                          fontSize: setFont(14),
                          height: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: setWidth(15),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: setWidth(60),
                      ),
                      child: Text(
                        "10分钟前",
                        style: TextStyle(
                          color: KColor.secondaryElementText,
                          fontFamily: KFont.Avenir,
                          fontWeight: FontWeight.normal,
                          fontSize: setFont(14),
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: KColor.primaryText,
                        size: 24,
                      ),
                      onTap: (){},
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
