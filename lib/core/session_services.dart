import 'package:get/get.dart';
import 'package:ollang_recipe/core/hive_storage.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/models/recipes_search_info_model.dart';

///[SessionServices] is a class that always runs in the background and handles some background processes.
class SessionServices extends GetxController {
  HiveStorage hiveStorage = HiveStorage();
  RecipesSearchInfoModel recipesSearchInfo = RecipesSearchInfoModel();

  saveFavorite(Recipe recipe) async {
    if (hiveStorage.user.favorites.firstWhereOrNull((element) =>
            element.label == recipe.label && element.uri == recipe.uri) ==
        null) {
      hiveStorage.user.favorites.add(recipe);
      hiveStorage.user.favorites.toSet();
      await hiveStorage.user.save();
    } else {
      deleteFavorite(recipe);
    }
  }

  deleteFavorite(Recipe recipe) async {
    hiveStorage.user.favorites
        .removeWhere((element) => element.label == recipe.label);
    await hiveStorage.user.save();
  }
}
