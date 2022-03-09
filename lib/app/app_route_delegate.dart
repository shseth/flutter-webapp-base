import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:webapp/app/app_route_path.dart';
import 'package:webapp/app/screens/Home.dart';

class AppRouteDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  String pathName = '';
  bool isUnknown = false;
  BuildContext context;

  AppRouteDelegate({required this.context});

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  AppRoutePath get currentConfiguration {
    if (isUnknown) return AppRoutePath.unknown();
    if (pathName == "") return AppRoutePath.home();

    return AppRoutePath.other(pathName);
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    dev.log('New Route: ' + configuration.pathName, level: 100);
    if (configuration.isUnknown) {
      pathName = "";
      isUnknown = true;
      return;
    }

    if (configuration.isOtherPage) {
      pathName = configuration.pathName;
      isUnknown = false;
    }
    else {
      pathName = "";
      isUnknown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: _webappStack,
        onPopPage: (route, result) {
          final bool success = route.didPop(result);
          if (success) {
            pathName = "";
            isUnknown = false;
          }
          return success;
        });
  }

  List<Page> get _webappStack => [
    const MaterialPage(key: ValueKey('Home'), child: Home()),
  ];
}
