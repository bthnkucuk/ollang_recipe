import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/screens/detail_screen/detail_screen.dart';

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
          routes: {
            Screens.home: (context) => const HomeScreen(),
            Screens.favorite: (context) => const FavoriteScreen(),
            Screens.detail: (context) {
              var recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

              return DetailScreen(recipe: recipe);
            },
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

///[Screens] is a class that contains all the routes of the application
class Screens {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String detail = '/detail';
}
