import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_input_field.dart';
import 'package:ollang_recipe/components/single_recipe_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../components/my_app_bar.dart';
import '../../../theme/text_style.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: controller.scaffoldKey,
          appBar: MyAppBar(
            centerTitle: 'Ollang Recipe',
            leadingIcon: controller.themeIcon.value,
            leadingOnPressed: controller.changeTheme,
            trailingIcon: Icons.favorite_outline_outlined,
            trailingOnPressed: controller.goFavorite,
          ),
          body: Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "What is in your kitchen?",
                    style: s20W600,
                  ),
                  Text(
                    "Type some ingredients or recipeies.",
                    style: s12W300,
                  ),
                  SizedBox(height: 10.h),
                  MyInputField(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: () => controller.filterSearch(),
                        child: const Icon(Icons.tune_outlined)),
                    hintText: "type something",
                    onSubmitted: (p) {
                      controller.search(p);
                    },
                  ),
                  if (controller.loadingStatus == LoadingStatus.loaded)
                    if (controller.recipiesList.isNotEmpty)
                      Expanded(
                        child: ScrollablePositionedList.builder(
                          itemScrollController: controller.scrollController,
                          itemPositionsListener: controller.positionsListener,
                          shrinkWrap: true,
                          itemCount: controller.recipiesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                if (index == 0) SizedBox(height: 20.h),
                                GestureDetector(
                                  onTap: () => controller.goDetail(
                                      controller.recipiesList[index].recipe!),
                                  child: SingleRecipeWidget(
                                    onFavIconTap: () =>
                                        controller.saveFav(index),
                                    recipe:
                                        controller.recipiesList[index].recipe!,
                                  ),
                                ),
                                SizedBox(height: 10.h),

                                // for lazy load
                                if (index == controller.recipiesList.length - 1)
                                  Container(
                                    height: 40.h,
                                    margin: EdgeInsets.only(bottom: 30.h),
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                              ],
                            );
                          },
                        ),
                      )
                    else
                      const Expanded(
                          child: Center(child: Text("Nothing found!")))
                  else
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
