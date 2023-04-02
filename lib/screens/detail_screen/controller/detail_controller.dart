import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
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

  Future<void> goBack() => Navigator.maybePop(context).whenComplete(() => FocusScope.of(context).unfocus());

  late List<String> nutritionInfos = [];

  final List<IconData> nutrionIcons = [
    Icons.cake_outlined,
    Icons.egg_alt_outlined,
    Icons.local_fire_department_outlined,
    Icons.lunch_dining_outlined
  ];
  late final ScrollController scrollController;
  ScreenshotController screenshotController = ScreenshotController();

  final sessionService = Get.find<SessionServices>();

  void saveFav() {
    recipe.isFavorite.value = !recipe.isFavorite.value;
    sessionService.saveFavorite(recipe);
  }

//for share recipe
  share() async {
    final directory = (await getApplicationDocumentsDirectory()).path;

    var ss = await screenshotController.captureAndSave(directory,
        fileName: 'scren_shot_detailaa.jpg', delay: const Duration(milliseconds: 100));

    Share.shareXFiles(
      [XFile(ss!)],
      text: 'Ollang Recipe',
      subject: recipe.label!.utf8CodecEncoded,
    );
  }

  final RxDouble scrollRange = 1.0.obs;
  _scrollListener() {
    var offset = scrollController.offset;
    var max = scrollController.position.maxScrollExtent;

    scrollRange.value = (max - offset) / max;

    if (scrollRange.value < 0) {
      scrollRange.value = 0;
    } else if (scrollRange.value > 1) {
      scrollRange.value = 1;
    }

    if (offset < -150) Navigator.maybePop(context).whenComplete(() => FocusScope.of(context).unfocus());
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
  }
}
