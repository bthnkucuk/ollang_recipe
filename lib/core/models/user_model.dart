import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
part 'user_model.g.dart';

///[User] is a class that use hive package and save user data.
///[searchHistory] is a list of string that save user search history.
///[favorites] is a list of [Recipe] that save user favorite recipe.
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late List<String> searchHistory;
  @HiveField(1)
  late List<Recipe> favorites;
}
