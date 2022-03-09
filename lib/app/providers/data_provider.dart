import 'dart:developer' as dev;

import 'package:webapp/app/models/menu_item.dart';
import 'package:webapp/app/providers/abstract_provider.dart';


class DataProvider extends AbstractProvider {

  late List<MenuItem> _menus;
  List<MenuItem> get menus => _menus;

  DataProvider({
    context,
  }) : super(context: context) {
    dev.log("Starting DataProvider...");
    _menus = _generateMenus();
  }
}

List<MenuItem> _generateMenus() {
  return [
    MenuItem(name: 'home', label: 'Home', path: ""),
  ];
}