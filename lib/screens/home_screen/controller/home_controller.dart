import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoadingStatus { loading, loaded, error }

class HomeController extends GetxController {
  final key = GlobalKey();

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
