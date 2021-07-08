// *using router :
//  *  ```
//  Navigator.pushNamed(Routes.routeName)
//  * ```
//  *
// *passing arguments, routes that require arguments recieve it through a map (occassionally Strings )
//  *
//  * the structure of map for arguments for certain
// *  routes is present as a documentation comment
// *  ```
//  Navigator.pushNamed(Routes.routeName, arguments: {"key1":val1,"key2":val2})
//  * ```
// * you can hover a route it anywhere in VSCode/Android Studio to see argement structure
class Routes {
  //home
  static const String home = 'homePage';
  static const String funds = 'fundsPage';
  static const String prices = 'pricesPage';
  static const String news = 'newsPage';

  //account
  static const String accounts = 'accounts';
  static const String referAndEarn = 'referAndEarn';

  //auth
  static const String forgotPwd = 'forgetPassword';
  static const String logInSignUp = 'logInSignUP';
  static const String signIn = 'signIn';
  static const String signUp = 'SignUp';
  static const String otpVerification = 'otpVerification';

  static const List<String> bottomNavBarRoutes = [home, funds, prices, news];

  static const List<String> unprotectedRouts = [signIn, signUp, forgotPwd];
}
