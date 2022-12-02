import 'package:flutter/material.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/recycle_bin.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case ToDoList.id:
        return MaterialPageRoute(builder: (_) => ToDoList());
      default:
        return null;
    }
  }
}
