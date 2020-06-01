import 'package:auto_route/auto_route_annotations.dart';
import 'package:shop/pages/details/details.dart';
import 'package:shop/pages/index/index.dart';
import 'package:shop/pages/sign_in/sign_in.dart';
import 'package:shop/pages/sign_up/sign_up.dart';
import 'package:shop/pages/welcome.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial
  Index indexPageRoute;

  WelcomePage welcomePage;

  SignIn signInPage;
  SignUp signUpPage;

//  @GuardedBy([AuthGuard])
//  ApplicationPage applicationPage;

  // @GuardedBy([AuthGuard])
  DetailsPage detailsPage;
}

