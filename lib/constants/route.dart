import 'package:firebaseproject/screens/email_auth/login_screen.dart';
import 'package:firebaseproject/screens/email_auth/signup_screen.dart';
import 'package:firebaseproject/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splashPath = "/";
  static const String loginPage = "/loginPage";
  static const String signupPage = "/signupPage";

  static const String home = "/home";

  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signupPage':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
