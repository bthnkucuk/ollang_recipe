import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/bottom_sheet.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_media_query.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/repository.dart';

import '../../../core/loading_status.dart';
import '../../../core/router.dart';
import '../../../core/session_services.dart';
import '../../../theme/material_app_updater.dart';
import '../../../theme/text_style.dart';
import '../view/filter_view.dart';

part '../widget/search_history.dart';

class HomeController extends GetxController {
  final sessionService = Get.find<SessionServices>();
  final scaffoldKey = GlobalKey();
  late final FocusNode focusNode;
  final textEditingController = TextEditingController();
  final RxString appBarTitle = 'Ollang Recipe'.obs;
  final Rx<IconData> themeIcon = Rx(Icons.light_mode_outlined);
  final scrollController = ScrollController();

  final Rx<LoadingStatus> _loadingStatus = LoadingStatus.loaded.obs;
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  final RxList<Hit> recipiesList = <Hit>[].obs;
  String? nextPage;

  //For fitering the recipes
  final RxDouble timeStart = 0.0.obs;
  final RxDouble timeEnd = 300.0.obs;
  final RxList<String> dishTypeSelectedList = <String>[].obs;
  final RxList<String> mealTypeSelectedList = <String>[].obs;
  final RxList<String> cuisineTypeSelectedList = <String>[].obs;
  final RxList<String> healtSelectedList = <String>[].obs;
  //For http request query parameters
  Map<String, dynamic> filterForQuery = {};

  ///[applyFilter] is applying the filter to the query and search the recipe.
  void applyFilter() {
    if (dishTypeSelectedList.isNotEmpty) {
      filterForQuery[FilterTypes.dishType.name] = dishTypeSelectedList;
    }
    if (mealTypeSelectedList.isNotEmpty) {
      filterForQuery[FilterTypes.mealType.name] = mealTypeSelectedList;
    }
    if (cuisineTypeSelectedList.isNotEmpty) {
      filterForQuery[FilterTypes.cuisineType.name] = cuisineTypeSelectedList;
    }
    if (healtSelectedList.isNotEmpty) {
      filterForQuery[FilterTypes.health.name] = healtSelectedList;
    }

    if (timeStart.value != 0 || timeEnd.value != 300) {
      filterForQuery['time'] = '${timeStart.value.toInt()}-${timeEnd.value.toInt()}';
    }

    search(textEditingController.text);
    Navigator.maybePop(context);
  }

//when the search text is focused, the history overlay will be shown.
  _focusListener() {
    if (focusNode.hasFocus && searchHistory.isNotEmpty) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }
  //

  final RxList<String> searchHistory = <String>[].obs;

  final GlobalKey overlayDimensionKey = GlobalKey();
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;

  void showOverlay() {
    RenderBox renderBox = overlayDimensionKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(builder: (context) {
      return Obx(() => _SearchHistory(
          offset: offset,
          // ignore: invalid_use_of_protected_member
          list: searchHistory.value,
          onTap: (value) async {
            textEditingController.text = value;
            FocusScope.of(context).unfocus();
            await search(value);
          },
          onDelete: (value) async {
            searchHistory.value = await sessionService.deleteHistory(value);
          }));
    });
    overlayState = Overlay.of(context);
    overlayState!.insert(overlayEntry!);
  }

  void hideOverlay() {
    if (overlayEntry == null) return;
    overlayEntry!.remove();
    overlayEntry = null;
  }

  ///[getFilter] is getting the filter for the filter,
  ///ist taking filters from [RecipesSearchInfoModel] the model is getting from the api in splash screen.
  List<String> getFilter(FilterTypes type) {
    try {
      return sessionService.recipesSearchInfo.recipesSearchInfoModelGet!.parameters!
          .firstWhere((element) => element.name == type.name)
          .items!
          .itemsEnum!;
    } catch (e) {
      return [];
    }
  }

  ///[findRandom] is finding the random recipe from the api.
  ///api not executing empty query, so it is taking the random filter from the [getFilter] method.
  ///if at least one filter is selected, api will execute the query with the selected filter.
  /// isRandom is add query parameter 'random=true'
  Future<void> findRandom() async {
    var random = getFilter(FilterTypes.mealType);
    random.shuffle();

    try {
      loadingStatus = LoadingStatus.wait;
      var response = await Repository.instance.search('', filterQuery: {'mealType': random.first}, isRandom: true);
      loadingStatus = LoadingStatus.loaded;
      if (context.mounted) await Navigator.pushNamed(context, Screens.detail, arguments: response.hits!.first.recipe);
    } catch (e) {
      debugPrint(e.toString());
      loadingStatus = LoadingStatus.error;
    }
  }

//for saving selected filter to the list
  void saveFilter(String chip, FilterTypes type) {
    switch (type) {
      case FilterTypes.dishType:
        addRemoveFilter(dishTypeSelectedList, chip);
        break;
      case FilterTypes.health:
        addRemoveFilter(healtSelectedList, chip);
        break;
      case FilterTypes.cuisineType:
        addRemoveFilter(cuisineTypeSelectedList, chip);
        break;
      case FilterTypes.mealType:
        addRemoveFilter(mealTypeSelectedList, chip);
        break;
      default:
    }
  }

  void addRemoveFilter(List<String> list, String chip) {
    if (list.contains(chip)) {
      list.remove(chip);
    } else {
      list.add(chip);
    }
  }

  BuildContext get context => scaffoldKey.currentContext!;

//for changing the theme
  void changeTheme() => MaterialAppInheritedWidget.of(context).changeTheme();
  Future<void> goFavorite() async => await Navigator.pushNamed(context, Screens.favorite);
  void goDetail(Recipe recipe) => Navigator.pushNamed(context, Screens.detail, arguments: recipe);

  void filterSearch() {
    ModalBottomSheet.showBottomSheet(const FilterView(), context, title: 'Filter');
  }

//for clearing the filter
  void clearFilters() {
    dishTypeSelectedList.clear();
    mealTypeSelectedList.clear();
    cuisineTypeSelectedList.clear();
    healtSelectedList.clear();
    filterForQuery.clear();
    timeStart(0.0);
    timeEnd(300.0);

    Navigator.maybePop(context);
  }

  ///[search] is searching the recipe from the api.
  ///if some error occurs, it will change [LoadingStatus] to error.
  ///if not error occurs, it will change [LoadingStatus] to loaded.
  Future<void> search(String query) async {
    if (textEditingController.text.isNotEmpty) {
      searchHistory.value = await sessionService.saveHistory(query);
    }

    if (textEditingController.text.isNotEmpty || filterForQuery.isNotEmpty) {
      try {
        loadingStatus = LoadingStatus.loading;
        final response = await Repository.instance.search(query, filterQuery: filterForQuery);

        recipiesList.value = response.hits!;
        nextPage = response.links!.next != null ? response.links!.next!.href : null;

        for (var element in recipiesList) {
          element.recipe!.label;
          final isElementFavorite = sessionService.hiveStorage.user.favorites.firstWhereOrNull((whereElement) =>
                  whereElement.label == element.recipe!.label && whereElement.uri! == element.recipe!.uri!) !=
              null;
          if (isElementFavorite) {
            element.recipe!.isFavorite.value = true;
          }
        }

        loadingStatus = LoadingStatus.loaded;
      } catch (e) {
        debugPrint(e.toString());
        loadingStatus = LoadingStatus.error;
      }
    }
  }

  ///[saveFav] is saving the recipe to the favorite list.
  void saveFav(int index) {
    recipiesList[index].recipe!.isFavorite.value = !recipiesList[index].recipe!.isFavorite.value;
    sessionService.saveFavorite(recipiesList[index].recipe!);
  }

//for first open
  firstOpenRondomRecipies() async {
    loadingStatus = LoadingStatus.loading;

    var random = getFilter(FilterTypes.mealType);
    random.shuffle();

    var response = await Repository.instance.search('', filterQuery: {'mealType': random.first});
    recipiesList.value = response.hits!;
    nextPage = response.links!.next != null ? response.links!.next!.href : null;

    loadingStatus = LoadingStatus.loaded;
  }

  lazyLoad() {
    /// for lazy load
    /// if the scroll is at the max scroll extent - 400, it will execute the [search] method.
    /// nextPage is the next page url from the api.
    /// nextPage can be null. Its for not sending too many request to the api and detect the if next page is exist.
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent - 400 <= scrollController.offset) {
        try {
          if (nextPage != null) {
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
  void onInit() async {
    super.onInit();
    focusNode = FocusNode()..addListener(_focusListener);
    searchHistory.value = sessionService.hiveStorage.user.searchHistory;
    await firstOpenRondomRecipies();
    lazyLoad();
  }

  @override
  void onClose() {
    super.onClose();
    focusNode.removeListener(() {});
    focusNode.dispose();
    textEditingController.dispose();
    scrollController.dispose();
  }
}
