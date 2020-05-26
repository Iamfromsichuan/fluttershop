import 'package:flutter/cupertino.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';

Widget newsCategoriesWidget({
  List<CategoryResponseEntity> categories,
  String selCategoryCode,
  Function(CategoryResponseEntity) onTap,
}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map<Widget>((item) {
              return Container(
                alignment: Alignment.center,
                height: setHeight(52),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: selCategoryCode == item.code
                          ? KColor.secondaryElementText
                          : KColor.primaryText,
                      fontSize: setFont(18),
                      fontFamily: KFont.Montserrat,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () => onTap(item),
                ),
              );
            }).toList(),
          ),
        );
}
