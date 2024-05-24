import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitara/pitara/quiz/presentation/screens/DSAScreen.dart';
import 'package:pitara/pitara/quiz/presentation/screens/Homepage.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case '/':
        return _materialRoute(const HomePage());
      case '/DsaScreen':
        return _materialRoute(DsaScreen());
      default:
        return _materialRoute(const HomePage());
    }
  }
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
