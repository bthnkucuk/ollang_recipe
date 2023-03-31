import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late List<String> searchHistory;
  @HiveField(1)
  late List<Recipe> favorites;

  @override
  String toString() {
    return '';
  }
}
