import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';

import 'models/user_model.dart';

///[HiveStorage] is a class that stores the user's data in the local database.
class HiveStorage {
  late Box<User> _box;
  late User user;
  HiveStorage() {
    _initHive();
  }

  ///[initHive] is a function that initialize hive database.
  _initHive() async {
    await Hive.initFlutter();

    ///this if statements check if the adapter is registered or not.
    ///if not registered, register it.
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(RecipeAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ImagesAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(LargeAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(TotalAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(TotalAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(IngredientAdapter());
    }
    _box = await Hive.openBox<User>('user_box');

    if (_box.get("user") == null) {
      await _box.put(
          "user",
          User()
            ..favorites = []
            ..searchHistory = []);
    }

    user = _box.get("user")!;

    //  _box.clear();
  }
}
