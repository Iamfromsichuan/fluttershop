import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/index.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Widget _buildLogo() {
    return Container(
      width: setWidth(110),
      margin: EdgeInsets.only(top: setHeight(40 + 44.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: setWidth(76),
            width: setWidth(76),
            margin: EdgeInsets.symmetric(horizontal: setWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: setWidth(76),
                    decoration: BoxDecoration(
                      color: KColor.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius:
                          BorderRadius.all(Radius.circular(setWidth(76 * 0.5))),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: setWidth(13),
                  child: Image.asset(
                     "${KString.ImageAssetsBasePath}logo.png",
                    fit: BoxFit.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(15)),
            child: Text(
              "SECTRO",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: KColor.primaryText,
                fontFamily: KFont.Montserrat,
                fontWeight: FontWeight.w600,
                fontSize: setFont(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KColor.primaryText,
              fontFamily: KFont.Avenir,
              fontWeight: FontWeight.w400,
              fontSize: setFont(16),
              height: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputForm() {
    return Container();
  }

  Widget _buildThirdPartLogin() {
    return Container();
  }

  Widget _buildSignUpButton() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
