import 'package:flutter/material.dart';
import 'package:realm_todolist_flutter/screens/homepage.dart';
import 'package:realm_todolist_flutter/screens/recycle_bin.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}