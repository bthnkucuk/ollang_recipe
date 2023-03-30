import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';

enum LoadingStatus { loading, loaded, error }

class FavoriteController extends GetxController {
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;

  final session = Get.find<SessionServices>();

  final RxList<Recipe> recipiesList = <Recipe>[].obs;

  loadRecipes() {
    recipiesList.value = session.hiveStorage.user.favorites.reversed.toList();

    loadingStatus = LoadingStatus.loaded;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    loadRecipes();
  }
}
