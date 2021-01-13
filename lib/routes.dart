import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/features/error/pages/error_page.dart';
import 'package:flutter_architecture/presentation/features/home/pages/home_page.dart';
import 'package:flutter_architecture/presentation/features/splash/pages/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case '/error':
        return MaterialPageRoute(builder: (_) => ErrorPage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
