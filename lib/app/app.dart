import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/app/app_route_delegate.dart';
import 'package:webapp/app/app_route_information_parser.dart';
import 'package:webapp/app/providers/data_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: kDebugMode,
        title: "WebApp",
        routeInformationParser: AppRouteInformationParser(context: context),
        routerDelegate: AppRouteDelegate(context: context),
      ),
    );
  }
}
