import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/bottom_sheet.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/repository.dart';

import '../../../main.dart';
import '../../../theme/material_app_updater.dart';

enum LoadingStatus { loading, loaded, error }

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey();
  BuildContext get context => scaffoldKey.currentContext!;
  final Rx<IconData> themeIcon = Rx(Icons.light_mode_outlined);

  void changeTheme() {
    if (MaterialAppInheritedWidget.of(context).themeMode == ThemeMode.light) {
      themeIcon(Icons.dark_mode_outlined);
    } else {
      themeIcon(Icons.light_mode_outlined);
    }
    MaterialAppInheritedWidget.of(context).changeTheme();
  }

  void goFavorite() => Navigator.pushNamed(context, Screens.favorite);

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

  search(String query) async {
    try {
      loadingStatus = LoadingStatus.loading;
      final response = await Repository.instance.search(query);

      recipiesList.value = response.data!.hits!;

      loadingStatus = LoadingStatus.loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.error;
    }
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
}
