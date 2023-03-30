import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/bottom_sheet.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/repository.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/session_services.dart';
import '../../../main.dart';
import '../../../theme/material_app_updater.dart';

enum LoadingStatus { loading, loaded, error }

class HomeController extends GetxController {
  final sessionService = Get.find<SessionServices>();
  final scaffoldKey = GlobalKey();
  BuildContext get context => scaffoldKey.currentContext!;
  final Rx<IconData> themeIcon = Rx(Icons.light_mode_outlined);

  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener positionsListener = ItemPositionsListener.create();

  void changeTheme() {
    if (MaterialAppInheritedWidget.of(context).themeMode == ThemeMode.light) {
      themeIcon(Icons.dark_mode_outlined);
    } else {
      themeIcon(Icons.light_mode_outlined);
    }
    MaterialAppInheritedWidget.of(context).changeTheme();
  }

  void goFavorite() => Navigator.pushNamed(context, Screens.favorite);
  void goDetail(Recipe recipe) =>
      Navigator.pushNamed(context, Screens.detail, arguments: recipe);

  void filterSearch() {
    ModalBottomSheet.showBottomSheet(
        Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
            const SizedBox(height: 200)
          ],
        ),
        context,
        title: "title");
  }

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;

  final RxList<Hit> recipiesList = <Hit>[].obs;
  String? nextPage;

  Future<void> search(String query) async {
    try {
      loadingStatus = LoadingStatus.loading;
      final response = await Repository.instance.search(query);

      recipiesList.value = response.hits!;
      nextPage = response.links!.next!.href;

      recipiesList.forEach((element) {
        element.recipe!.label;
        final isElementFavorite = sessionService.hiveStorage.user.favorites
                .firstWhereOrNull((whereElement) =>
                    whereElement.label == element.recipe!.label &&
                    whereElement.uri! == element.recipe!.uri!) !=
            null;
        if (isElementFavorite) {
          element.recipe!.isFavorite.value = true;
        }
      });

      loadingStatus = LoadingStatus.loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.error;
    }
  }

  void saveFav(int index) {
    recipiesList[index].recipe!.isFavorite.value =
        !recipiesList[index].recipe!.isFavorite.value;
    sessionService.saveFavorite(recipiesList[index].recipe!);
  }

  /// Init olduğunda çalıştırılacak olan Future işlemler.
  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;
      await Future.wait([
        Future.delayed(
          const Duration(seconds: 2),
        )
      ]);
      loadingStatus = LoadingStatus.loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.error;
    }
  }

  @override
  void onReady() {
    super.onReady();

    ready();
  }

  @override
  void onInit() {
    super.onInit();

    /// for lazy load
    positionsListener.itemPositions.addListener(() async {
      print(positionsListener.itemPositions.value.last.index);
      print(recipiesList.length);
      if (recipiesList.length - 10 ==
          positionsListener.itemPositions.value.last.index) {
        try {
          if (nextPage != null) {
            print("next page gelecek");

            Repository.instance.lazyLoadSearch(nextPage!).then((value) {
              recipiesList.addAll(value.hits!);
              nextPage = value.links!.next!.href;
              ;
            });

            nextPage = null;
          }
        } catch (_) {}
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
