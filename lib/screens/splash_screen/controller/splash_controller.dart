import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/loading_status.dart';
import '../../../main.dart';

class SplashController extends GetxController {
  final scaffoldKey = GlobalKey();

  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  BuildContext get context => scaffoldKey.currentContext!;

  Future<void> goHome() async =>
      await Navigator.popAndPushNamed(context, Screens.home);

  /// Init olduğunda çalıştırılacak olan Future işlemler.
  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;

      /// Dummy bekleme
      await Future.delayed(const Duration(seconds: 2));
      goHome();

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
}
