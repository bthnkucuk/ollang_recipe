import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/screens/home_screen/controller/home_controller.dart';

import '../../../core/loading_status.dart';
import '../../../core/router.dart';

class FavoriteController extends GetxController {
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;

  final sessionService = Get.find<SessionServices>();
  final homeController = Get.find<HomeController>();

  final RxList<Recipe> recipesList = <Recipe>[].obs;

  final scaffoldKey = GlobalKey();

  BuildContext get context => scaffoldKey.currentContext!;

  Future<void> goBack() => Navigator.maybePop(context)
      .whenComplete(() => FocusScope.of(context).unfocus());

  Future<void> goDetail(Recipe recipe) =>
      Navigator.pushNamed(context, Screens.detail,
          arguments: recipe..isFavorite.value = true);

  /// [deleteFav] is deleting the recipe from the local storage using sessionService.
  /// It also updates the [isFavorite] value of the recipe in the [homeController.recipesList] for updating home screen.
  void deleteFav(Recipe recipe) {
    sessionService.deleteFavorite(recipe);
    recipesList.remove(recipe);
    var homeRecipe = homeController.recipesList.firstWhereOrNull((element) =>
        element.recipe!.label == recipe.label &&
        element.recipe!.uri == recipe.uri);

    if (homeRecipe != null) {
      homeRecipe.recipe!.isFavorite.value = false;
    }
  }

  /// [loadRecipes] is loading the list of favorites from the local storage using sessionService.
  void loadRecipes() {
    recipesList.value =
        sessionService.hiveStorage.user.favorites.reversed.toList();
    loadingStatus = LoadingStatus.loaded;
  }

  @override
  void onReady() {
    super.onReady();
    loadRecipes();
  }
}
