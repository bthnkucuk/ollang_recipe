import 'package:flutter/material.dart';

import 'components/my_media_query.dart';

import 'core/router.dart';
import 'theme/material_app_updater.dart';
import 'theme/theme_dark.dart';
import 'theme/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyMediaQuery.setScreenSize();

    return MaterialAppUpdater(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Ollang Recipe',
          initialRoute: Screens.splash,
          onGenerateRoute: MyRouteGenerator.generate,
          navigatorKey: navigatorKey,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: MaterialAppInheritedWidget.of(context).themeMode,
        );
      }),
    );
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
