// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shop/pages/index/index.dart';
import 'package:shop/pages/welcome.dart';
import 'package:shop/pages/sign_in/sign_in.dart';
import 'package:shop/pages/sign_up/sign_up.dart';
import 'package:shop/pages/details/details.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePage = '/welcome-page';
  static const signInPage = '/sign-in-page';
  static const signUpPage = '/sign-up-page';
  static const detailsPage = '/details-page';
  static const all = {
    indexPageRoute,
    welcomePage,
    signInPage,
    signUpPage,
    detailsPage,
  };
}

class AppRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexArguments>(args)) {
          return misTypedArgsRoute<IndexArguments>(args);
        }
        final typedArgs = args as IndexArguments ?? IndexArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => Index(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomePage(),
          settings: settings,
        );
      case Routes.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignIn(),
          settings: settings,
        );
      case Routes.signUpPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUp(),
          settings: settings,
        );
      case Routes.detailsPage:
        if (hasInvalidArgs<DetailsPageArguments>(args)) {
          return misTypedArgsRoute<DetailsPageArguments>(args);
        }
        final typedArgs =
            args as DetailsPageArguments ?? DetailsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => DetailsPage(
              key: typedArgs.key, url: typedArgs.url, title: typedArgs.title),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//Index arguments holder class
class IndexArguments {
  final Key key;
  IndexArguments({this.key});
}

//DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final String url;
  final String title;
  DetailsPageArguments({this.key, this.url, this.title});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.indexPageRoute,
        arguments: IndexArguments(key: key),
      );

  Future pushWelcomePage() => pushNamed(Routes.welcomePage);

  Future pushSignInPage() => pushNamed(Routes.signInPage);

  Future pushSignUpPage() => pushNamed(Routes.signUpPage);

  Future pushDetailsPage({
    Key key,
    String url,
    String title,
  }) =>
      pushNamed(
        Routes.detailsPage,
        arguments: DetailsPageArguments(key: key, url: url, title: title),
      );
}
