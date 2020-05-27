import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';

Widget newsChannelsWidget({
  List<ChannelResponseEntity> channels,
  Function(ChannelResponseEntity) onTap,
}) {
  return Container(
    height: setHeight(137),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: channels.map<Widget>((item) {
          return Container(
            width: setWidth(70),
            height: setHeight(97),
            margin: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 图标
                  Container(
                    height: setWidth(64),
                    margin: EdgeInsets.symmetric(horizontal: setWidth(3)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: setWidth(64),
                            decoration: BoxDecoration(
                              color: KColor.primaryBackground,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                              borderRadius:
                              BorderRadius.all(Radius.circular(32)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: setWidth(10),
                          top: setWidth(10),
                          right: setWidth(10),
                          child: Image.asset(
                            "assets/images/channel-${item.code}.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 标题
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: KColor.thirdElementText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: setFont(14),
                      height: 1,
                    ),
                  ),
                ],
              ),
              onTap: () => onTap(item),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
