import 'package:flutter/material.dart';
import 'package:flutter_lession_2/ui/detail/detail_page.dart';
import 'package:flutter_lession_2/ui/home/home_page.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Scaffold());
      case '/Home':
        return _materialRoute(const HomePage());
      case '/Detail':
        return _materialRoute(DetailPage(id: settings.arguments as int));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
