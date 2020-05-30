import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/api/apis.dart';
import 'package:shop/config/index.dart';
import 'package:shop/entity/entity.dart';
import 'package:shop/global.dart';
import 'package:shop/util/index.dart';
import 'package:shop/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  _hanNavSignUp() {
    Navigator.pushNamed(context, "/sign_up");
  }

  _handleSignIn() async {
    /*UserLoginRequestEntity params = UserLoginRequestEntity(
      email: _emailController.value.text,
      password: zhSHA256(_pwdController.value.text),
    );
    print(params);

    print('---------------------------------------------------');

    List<CategoryResponseEntity> list = await NewsAPI.categories();
    print(list);*/
//    try{
//      UserLoginResponseEntity response = await UserApi.login(params: params);
//      Global.saveProfile(response);
//      print(response.toJson());
//    } catch (e) {
//      print(e);
//    }
    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: _emailController.value.text,
      password: _pwdController.value.text,
    );
    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
      context: context,
    );
    Global.saveProfile(userProfile);
    Navigator.pushNamed(context, "/app");
  }

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
    var marginTop = 49.0;
    return Container(
      width: setWidth(295),
//      height: setHeight(44),
      margin: EdgeInsets.only(top: setHeight(49)),
      child: Column(
        children: [
          Input(
            controller: _emailController,
            hintText: "Email",
            marginTop: 0,
            keyboardKey: TextInputType.datetime,
          ),
          Input(
            controller: _pwdController,
            hintText: "Password",
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(15.0)),
            child: Row(
              children: [
                btnFlatButtonWidget(
                  onPressed: _hanNavSignUp,
                  gbColor: KColor.thirdElement,
                  fontColor: KColor.primaryElementText,
                  title: "Sign Up",
                ),
                Spacer(),
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: KColor.primaryElement,
                  fontColor: KColor.primaryElementText,
                  title: "Sign In",
                ),
              ],
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
        onPressed: _hanNavSignUp,
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
