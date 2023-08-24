import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../perezentation/auth/auth_screen.dart';
import '../../perezentation/gmail_confirm/email_password.dart';
import '../../perezentation/splash/splash_screen.dart';
import '../../perezentation/tab/tabox_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String authScreen = "/auth_screen";
  static const String tabBox = "/tab_box";
  static const String confirmGmail = "/confirm_gmail";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.authScreen:
        return MaterialPageRoute(builder: (context) {
          return AuthScreen();
        });

      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => Tabbox());

      case RouteNames.confirmGmail:
        return MaterialPageRoute(builder: (context) => GmailConfirmScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}

