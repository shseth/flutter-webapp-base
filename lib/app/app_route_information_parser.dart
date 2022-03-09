import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:webapp/app/app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  BuildContext context;

  AppRouteInformationParser({
    required this.context
  });

  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    dev.log('parseRouteInformation: ' + uri.toString(), level: 100);

    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      if (pathName == "") return AppRoutePath.unknown();
      return AppRoutePath.other(pathName);
    }

    return AppRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    dev.log('restoreRouteInformation: ' + configuration.pathName, level: 100);
    if (configuration.isUnknown) return const RouteInformation(location: '/unknown');
    if (configuration.isHomePage) return const RouteInformation(location: '/');
    if (configuration.isOtherPage) return RouteInformation(location: '/${configuration.pathName}');

    return const RouteInformation(location: '/error');
  }
}
