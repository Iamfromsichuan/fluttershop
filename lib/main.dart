import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/global.dart';
import 'package:shop/provide/app.dart';
import 'package:shop/routes/router.gr.dart';
import './config/index.dart';

void main() {
  Global.init().then((e) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(
          builder: (context, state, _) {
            if (state.isGrayFilter) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                child: MyApp(),
              );
            }
            return MyApp();
          },
        ),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: KString.mainTitle,
        // 标题
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
        ),
//        routes: staticRoutes,
//        // inheritWidget 后面深入学习
//        home: Index(),
        builder: ExtendedNavigator<AppRouter>(
          initialRoute: Routes.indexPageRoute,
          router: AppRouter(),
          guards: [],
        ),
      ),
    );
  }
}
