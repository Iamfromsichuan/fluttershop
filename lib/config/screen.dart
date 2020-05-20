import 'package:flutter_screenutil/flutter_screenutil.dart';

double setWidth(double width) {
return ScreenUtil().setWidth(width);
}

double setHeight(double height) {
return ScreenUtil().setHeight(height);
}

double setFont(double fontSize) {
return ScreenUtil().setSp(fontSize, allowFontScalingSelf: true);
}
