import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/session_services.dart';

class DetailController extends GetxController {
  final Recipe recipe;
  DetailController(this.recipe) {
    nutritionInfos = [
      '${(recipe.totalNutrients!['CHOCDF']!.quantity ?? 0.0).toInt()}g carbs',
      '${(recipe.totalNutrients!['PROCNT']!.quantity ?? 0.0).toInt()}g proteins',
      '${(recipe.totalNutrients!['ENERC_KCAL']!.quantity ?? 0.0).toInt()} kcal',
      '${(recipe.totalNutrients!['FAT']!.quantity ?? 0.0).toInt()}g fats',
    ];
  }

  final scaffoldKey = GlobalKey();
  BuildContext get context => scaffoldKey.currentContext!;

  late final String? image = recipe.image;

  Future<void> goBack() => Navigator.maybePop(context)
      .whenComplete(() => FocusScope.of(context).unfocus());

  late List<String> nutritionInfos = [];

  final List<IconData> nutrionIcons = [
    Icons.cake_outlined,
    Icons.egg_alt_outlined,
    Icons.local_fire_department_outlined,
    Icons.lunch_dining_outlined
  ];

  final sessionService = Get.find<SessionServices>();

  void saveFav() {
    recipe.isFavorite.value = !recipe.isFavorite.value;
    sessionService.saveFavorite(recipe);
  }

//for share recipe
  share() async {
    final file = await DefaultCacheManager().getSingleFile(recipe.image!);

    Share.shareXFiles(
      [XFile(file.path)],
      text:
          "${recipe.label!}\n\nfor more info please check link \n\n${recipe.uri!}",
    );
  }
}
