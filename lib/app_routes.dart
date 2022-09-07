import 'package:deeplink/UI/screens/homepage_screen.dart';
import 'package:deeplink/UI/screens/splash_screen.dart';
import 'package:deeplink/constant/routes.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route? generateRouts(RouteSettings settings){
    switch (settings.name){
      case start:
        return MaterialPageRoute(builder: (_) =>
        const SplashScreen());
      case home:
        final code = settings.arguments;
        return MaterialPageRoute(builder: (_) => HomePageScreen(code: code,));
    }
  }
}