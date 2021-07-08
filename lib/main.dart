import 'dart:io';
import 'package:doors_tour_app/screens/home/home.dart';
import 'package:doors_tour_app/screens/onboardingPage.dart';
import 'package:doors_tour_app/services/GoogleSignInApi.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:doors_tour_app/utils/router/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      builder: (context, snapshot) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krayik',
      home: Builder(builder: (
        context,
      ) {
        context.watch<AuthService>().status;
        switch (context.watch<AuthService>().status) {
          case LoginStatus.idle:
            return OnboardingPage();
          case LoginStatus.loggedIn:
            return Home();
          case LoginStatus.loading:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            return OnboardingPage();
        }
      }),
      onGenerateRoute: router.Router.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
