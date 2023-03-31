import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/bottom_sheet.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/repository.dart';
import 'package:ollang_recipe/theme/text_style.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/loading_status.dart';
import '../../../core/session_services.dart';
import '../../../main.dart';
import '../../../theme/material_app_updater.dart';

class HomeController extends GetxController {
  final sessionService = Get.find<SessionServices>();
  final scaffoldKey = GlobalKey();
  final focusNode = FocusNode();
  final RxString appBarTitle = 'Ollang Recipe'.obs;
  final Rx<IconData> themeIcon = Rx(Icons.light_mode_outlined);

  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  final RxList<Hit> recipiesList = <Hit>[].obs;
  String? nextPage;

  BuildContext get context => scaffoldKey.currentContext!;

  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener positionsListener = ItemPositionsListener.create();

  void changeTheme() => MaterialAppInheritedWidget.of(context).changeTheme();
  Future<void> goFavorite() async => await Navigator.pushNamed(context, Screens.favorite);
  void goDetail(Recipe recipe) => Navigator.pushNamed(context, Screens.detail, arguments: recipe);

  void filterSearch() {
    ModalBottomSheet.showBottomSheet(_FilterWidget(), context, title: "Filter");
  }

  Future<void> search(String query) async {
    try {
      loadingStatus = LoadingStatus.loading;
      final response = await Repository.instance.search(query);

      recipiesList.value = response.hits!;
      nextPage = response.links!.next!.href;

      recipiesList.forEach((element) {
        element.recipe!.label;
        final isElementFavorite = sessionService.hiveStorage.user.favorites.firstWhereOrNull((whereElement) =>
                whereElement.label == element.recipe!.label && whereElement.uri! == element.recipe!.uri!) !=
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
    recipiesList[index].recipe!.isFavorite.value = !recipiesList[index].recipe!.isFavorite.value;
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
  Future<void> onReady() async {
    super.onReady();
    await ready();
  }

  @override
  void onInit() {
    super.onInit();

    /// for lazy load
    positionsListener.itemPositions.addListener(() async {
      if (recipiesList.length - 10 == positionsListener.itemPositions.value.last.index) {
        try {
          if (nextPage != null) {
            print("next page gelecek");

            Repository.instance.lazyLoadSearch(nextPage!).then((value) {
              recipiesList.addAll(value.hits!);
              nextPage = value.links!.next!.href;
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
    focusNode.removeListener(() {});
    focusNode.dispose();
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dish Type',
                  style: s16W600(context),
                ),
                Wrap(
                  spacing: 4.w,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    10,
                    (index) => Chip(
                      elevation: 0,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      labelStyle: s12W300(context),

                      /// TODO renk temadan
                      backgroundColor: Colors.green,
                      label: Text(
                        'index'.toString(),
                        style: s12W500(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dish Type',
                  style: s16W600(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
