import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/color.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(50)),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: KColor.primaryText,
          fontFamily: KFont.Montserrat,
          fontWeight: FontWeight.w600,
          height: 1,
          fontSize: setFont(24),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    var marginTop = 49.0;
    return Container(
      width: setWidth(295),
//      height: setHeight(44),
      margin: EdgeInsets.only(top: setHeight(49)),
      child: Column(
        children: [
          Input(
            controller: _fullNameController,
            hintText: "Full name",
            isPassword: false,
            marginTop: 0,
          ),
          Input(
            controller: _emailController,
            hintText: "Email",
            keyboardKey: TextInputType.datetime,
          ),
          Input(
            controller: _pwdController,
            hintText: "Password",
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(15.0)),
            child: btnFlatButtonWidget(
              onPressed: () {},
              gbColor: KColor.primaryElement,
              fontColor: KColor.primaryElementText,
              title: "Create an anccount",
              width: 294,
            ),
          ),
          Container(
            height: setHeight(22),
            margin: EdgeInsets.only(top: setHeight(20)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Forget password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColor.secondaryElementText,
                  fontFamily: KFont.Avenir,
                  fontWeight: FontWeight.w400,
                  fontSize: setFont(16),
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThirdPartLogin() {
    return Container(
      width: setWidth(295),
      margin: EdgeInsets.only(bottom: setHeight(40)),
      child: Column(
        children: [
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KColor.primaryText,
              fontFamily: KFont.Avenir,
              fontWeight: FontWeight.w400,
              fontSize: setHeight(16.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: setHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "twitter",
                  width: 88,
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "google",
                  width: 88,
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "facebook",
                  width: 88,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: setHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: (){
          Navigator.pop(context);
        },
        width: 294,
        gbColor: KColor.secondaryElement,
        fontColor: KColor.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: KColor.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: "注册页面");
            },
          )
        ],
      ),
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
