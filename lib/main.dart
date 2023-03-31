import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/screens/detail_screen/detail_screen.dart';
import 'package:ollang_recipe/screens/splash_screen/splash_screen.dart';

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
    Get.put(SessionServices());
    MyMediaQuery.setScreenSize();

    return MaterialAppUpdater(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Ollang Recipe',
          initialRoute: '/',
          onGenerateRoute: (settings) {
            if (settings.name == "/favorite") {
              return PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (_, __, ___) => const FavoriteScreen(),
                  transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c));
            }

            return MaterialPageRoute(builder: (_) => const SplashScreen());
          },
          routes: {
            Screens.splash: (context) => const SplashScreen(),
            Screens.home: (context) => const HomeScreen(),
            Screens.detail: (context) {
              var recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

              return DetailScreen(recipe: recipe);
            },
          },
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

///[Screens] is a class that contains all the routes of the application
class Screens {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String detail = '/detail';
}
