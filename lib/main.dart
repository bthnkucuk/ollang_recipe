import 'package:flutter/material.dart';

import 'components/my_media_query.dart';
import 'screens/favorite_screen/favorite_screen.dart';
import 'screens/home_screen/home_screen.dart';
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
          initialRoute: '/',
          routes: {
            Screens.home: (context) => const HomeScreen(),
            Screens.favorite: (context) => const FavoriteScreen(),
          },
          navigatorKey: Screens.navigatorKey,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: MaterialAppInheritedWidget.of(context).themeMode,
          home: const HomeScreen(),
        );
      }),
    );
  }
}

class Screens {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String home = '/home';
  static const String favorite = '/favorite';
}
