import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/screens/home_screen/controller/home_controller.dart';

enum LoadingStatus { loading, loaded, error }

class FavoriteController extends GetxController {
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loading.obs;

  final sessionService = Get.find<SessionServices>();
  final homeController = Get.find<HomeController>();

  final RxList<Recipe> recipiesList = <Recipe>[].obs;

  deleteFav(Recipe recipe) {
    sessionService.deleteFavorite(recipe);
    homeController.recipiesList
        .firstWhere((element) =>
            element.recipe!.label == recipe.label &&
            element.recipe!.uri == recipe.uri)
        .recipe!
        .isFavorite
        .value = false;
  }

  loadRecipes() {
    recipiesList.value =
        sessionService.hiveStorage.user.favorites.reversed.toList();

    loadingStatus = LoadingStatus.loaded;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    loadRecipes();
  }
}
