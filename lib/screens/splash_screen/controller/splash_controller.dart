import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/session_services.dart';

import '../../../core/loading_status.dart';
import '../../../core/models/recipes_search_info_model.dart';
import '../../../core/repository.dart';
import '../../../core/router.dart';

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
    // try {
    loadingStatus = LoadingStatus.loading;

    /// Dummy bekleme
    Get.put(SessionServices());

    Get.find<SessionServices>().recipesSearchInfo = await getSearchInfo();
    await Future.delayed(const Duration(seconds: 1));
    goHome();

    loadingStatus = LoadingStatus.loaded;
    // } catch (e) {
    //   loadingStatus = LoadingStatus.error;

    //   print(e);
    // }
  }

  Future<RecipesSearchInfoModel> getSearchInfo() async {
    var response = await Repository.instance.recipesSearchInfo();

    return response;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await ready();
  }
}
