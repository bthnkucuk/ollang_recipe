import 'package:get/get.dart';
import 'package:ollang_recipe/core/hive_storage.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/models/recipes_search_info_model.dart';

///[SessionServices] is a class that always runs in the background and handles some background processes.
class SessionServices extends GetxController {
  HiveStorage hiveStorage = HiveStorage();
  RecipesSearchInfoModel recipesSearchInfo = RecipesSearchInfoModel();

  Future<void> saveFavorite(Recipe recipe) async {
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

  Future<void> deleteFavorite(Recipe recipe) async {
    hiveStorage.user.favorites
        .removeWhere((element) => element.label == recipe.label);
    await hiveStorage.user.save();
  }

  Future<List<String>> saveHistory(String key) async {
    await deleteHistory(key);

    hiveStorage.user.searchHistory.add(key);
    await hiveStorage.user.save();

    var reversedList = hiveStorage.user.searchHistory.reversed.toList();

    if (reversedList.length > 10) {
      reversedList = reversedList.getRange(0, 10).toList();
    }

    return reversedList;
  }

  Future<List<String>> deleteHistory(String key) async {
    hiveStorage.user.searchHistory.removeWhere((element) => element == key);
    await hiveStorage.user.save();

    var reversedList = hiveStorage.user.searchHistory.reversed.toList();

    return reversedList;
  }
}
