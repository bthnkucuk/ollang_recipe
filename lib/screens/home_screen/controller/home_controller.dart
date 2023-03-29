import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final Rx<LoadingStatus> loadingStatus = LoadingStatus.loading.obs;

  /// Init olduğunda çalıştırılacak olan Future işlemler.
  Future<void> ready() async {
    try {
      loadingStatus(LoadingStatus.loading);
      await Future.wait([
        Future.delayed(
          const Duration(seconds: 2),
        )
      ]);
      loadingStatus(LoadingStatus.loaded);
    } catch (e) {
      loadingStatus(LoadingStatus.error);
    }
  }

  @override
  void onReady() {
    super.onReady();
    ready();
  }
}
