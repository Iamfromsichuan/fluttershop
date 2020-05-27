import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _buildPageHeaderTitle() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(60)),
      child: Column(
        children: [
          Text(
            "Feature",
            style: TextStyle(
                color: KColor.primaryText,
                fontFamily: KFont.Montserrat,
                fontWeight: FontWeight.w600,
                fontSize: setFont(24)),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeaderDetail() {
    return Container(
      width: setWidth(242),
      height: setHeight(70),
      margin: EdgeInsets.only(top: setHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: KColor.primaryText,
          fontSize: setFont(16),
          fontWeight: FontWeight.normal,
          fontFamily: KFont.Avenir,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildPageFeatureItem(
      String imageName, String info, double marginTop) {
    return Container(
      width: setWidth(295),
      height: setHeight(80),
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        children: [
          Container(
            width: setWidth(80),
            height: setWidth(80),
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: setWidth(195),
            child: Text(
              info,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: KColor.primaryText,
                fontFamily: KFont.Avenir,
                fontWeight: FontWeight.normal,
                fontSize: setFont(16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageButton() {
    return Container(
      width: setWidth(295),
      height: setHeight(44),
      margin: EdgeInsets.only(bottom: setHeight(20)),
      child: FlatButton(
        color: KColor.primaryElement,
        textColor: KColor.primaryElementText,
        child: Text("Get Started"),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/sign_in");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildPageHeaderTitle(),
            _buildPageHeaderDetail(),
            _buildPageFeatureItem(
                "feature-1",
                "Compelling photography and typography provide a beautiful reading",
                86),
            _buildPageFeatureItem(
                "feature-2",
                "Sector news never shares your personal data with advertisers or publishers",
                40),
            _buildPageFeatureItem(
                "feature-3",
                "You can get Premium to unlock hundreds of publications",
                40),
            Spacer(),
            _buildPageButton(),
          ],
        ),
      ),
    );
  }
}
