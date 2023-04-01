import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/screens/home_screen/controller/home_controller.dart';

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

  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;

      ///[SessionServices] is a GetxController that is used to handle background processes.
      ///its starting splash screen and running in the background.
      Get.put(SessionServices());

      ///[getSearchInfo] is getting the search info from the api. There are api request schema.
      ///Im usig the schema to create the filters. And finde api filters.
      Get.find<SessionServices>().recipesSearchInfo = await getSearchInfo();
      await Future.delayed(const Duration(seconds: 2));

      // when background processes are done, navigate to home screen
      goHome();

      loadingStatus = LoadingStatus.loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.error;

      print(e);
    }
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
