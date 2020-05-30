import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/global.dart';
import 'package:shop/provide/app.dart';
import 'package:shop/util/authentication.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Column(
      children: <Widget>[
        Text("用户: ${Global.profile.displayName}"),
        Divider(),
        MaterialButton(
          onPressed: () {
             goLoginPage(context);
          },
          child: Text('退出'),
        ),
        Divider(),
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text('灰色切换 ${appState.isGrayFilter}'),
        ),
      ],
    );
  }
}
