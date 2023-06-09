import 'package:flutter/material.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/screens/detail_screen/detail_screen.dart';
import 'package:ollang_recipe/screens/favorite_screen/favorite_screen.dart';
import 'package:ollang_recipe/screens/home_screen/home_screen.dart';
import 'package:ollang_recipe/screens/splash_screen/splash_screen.dart';

///[Screens] is a class that contains all the routes of the application
/// and navigate to route based on [Screens] names.

class Screens {
  static const String splash = '/';
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String detail = '/detail';
  static const String error = '/error';

  static Route<dynamic> navigateTo(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Screens.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Screens.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case Screens.detail:
        var recipe = routeSettings.arguments as Recipe;
        return MaterialPageRoute(builder: (_) => DetailScreen(recipe: recipe));
      case Screens.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
