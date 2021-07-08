import 'package:doors_tour_app/screens/Authentication/login_sign_up.dart';
import 'package:doors_tour_app/screens/Authentication/signin.dart';
import 'package:doors_tour_app/screens/Authentication/signup.dart';
import 'package:doors_tour_app/screens/Funds/fundbody.dart';
import 'package:doors_tour_app/screens/Prices/prices.dart';
import 'package:doors_tour_app/screens/accounts.dart';
import 'package:doors_tour_app/screens/home/home.dart';
import 'package:doors_tour_app/screens/news/newsscreen.dart';
import 'package:doors_tour_app/screens/referandearn.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
    Adding route to router
 * Step 1: Add your route as a member in Routes class of lib/utils/RoutingUtils.dart
 * if your route takes an argument mention it above the member as a doc comment
 * Step 2: Add case to this files
    you can just copy this code and paste it above "Paste code above this comment"

    case Routes.yourRouteName:
    return MaterialPageRoute(builder: (_) {
    //run type checks if you want to on arguements
    return YourWidget();
    });
    You can run type checks and return any wigdet you want but don't forget to return some wiget at the end
 */
class Router {
  Router._();
  static Widget wrong =
      Scaffold(body: Center(child: Text('Something went wrong')));

  static MaterialPageRoute routify(Widget screen) =>
      MaterialPageRoute(builder: (_) => Scaffold(body: screen));

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        //auth
        case Routes.logInSignUp:
          return routify(LoginSignUp());
        case Routes.signIn:
          return routify(SignInPage());
        case Routes.signUp:
          return routify(SignUpPage());

        //account
        case Routes.accounts:
          return routify(Accounts());
        case Routes.referAndEarn:
          return routify(ReferAndEarn());

        //home [home, funds, prices, news]
        case Routes.home:
          return routify(Home());
        case Routes.funds:
          return routify(Funds());
        case Routes.prices:
          return routify(Prices());
        case Routes.news:
          return routify(News());

        // Paste new routes above this
        default:
          return routify(
              Center(child: Text('No route defined for ${settings.name}')));
      }
    } catch (e) {
      return routify(wrong);
    }
  }
}
