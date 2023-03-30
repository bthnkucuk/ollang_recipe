import 'package:get/get.dart';
import 'package:ollang_recipe/core/hive_storage.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';

class SessionServices extends GetxController {
  HiveStorage hiveStorage = HiveStorage();

  saveFavorite(Recipe recipe) async {
    if (hiveStorage.user.favorites
            .firstWhereOrNull((element) => element.label == recipe.label) ==
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
