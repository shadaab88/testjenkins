
import 'package:flutter/material.dart';

import '../view/login.dart';
import '../view/otp.dart';
import '../view/register.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    final args = settings!.arguments;
    print("PUSHED ${settings.name} WITH ARGS: ${settings.arguments}");
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case RegisterPage.route:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );

      case OtpPage.route:
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
        );

      default:
        return _errorRoute(settings.name!);
    }
  }

  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ROUTE \n\n$name\n\nNOT FOUND'),
        ),
      );
    });
  }
}