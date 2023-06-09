import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ollang_recipe/core/extensions.dart';
import 'package:ollang_recipe/components/my_input_field.dart';
import 'package:ollang_recipe/core/my_media_query.dart';
import 'package:ollang_recipe/components/single_recipe_widget.dart';
import 'package:ollang_recipe/core/assets.dart';

import '../../../components/my_app_bar.dart';
import '../../../core/loading_status.dart';
import '../../../core/theme/text_style.dart';
import '../controller/home_controller.dart';

part '../widget/random_recipe_wait.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        key: controller.scaffoldKey,
        appBar: MyAppBar(
          centerTitle: 'Ollang Recipe',
          leadingIcon: Theme.of(context).brightness == Brightness.light
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
          leadingOnPressed: controller.changeTheme,
          trailingIcon: Icons.favorite_outline_outlined,
          trailingOnPressed: controller.goFavorite,
        ),
        body: Obx(() {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'What is in your kitchen?',
                      style: s20W600(context),
                    ),
                    Text(
                      'Type some ingredients or recipeies.',
                      style: s12W300(context),
                    ),
                    SizedBox(height: 10.h),

                    //search area
                    Row(
                      key: controller.overlayDimensionKey,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 10,
                          child: SizedBox(
                            height: 46.h,
                            child: MyInputField(
                              controller: controller.textEditingController,
                              focusNode: controller.focusNode,
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () => controller.findRandom(),
                                      child: const Icon(Icons.casino_outlined),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () => controller.filterSearch(),
                                      child: const Icon(Icons.tune_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              hintText: 'Find best recipes',
                              onSubmitted: (p) => controller.search(p),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    //recipes list
                    if (controller.loadingStatus == LoadingStatus.loaded)
                      if (controller.recipesList.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemCount: controller.recipesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  if (index == 0) SizedBox(height: 20.h),
                                  GestureDetector(
                                    onTap: () => controller.goDetail(
                                        controller.recipesList[index].recipe!),
                                    child: SingleRecipeWidget(
                                      onFavIconTap: () =>
                                          controller.saveFav(index),
                                      recipe:
                                          controller.recipesList[index].recipe!,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),

                                  // for lazy load
                                  if (index ==
                                          controller.recipesList.length - 1 &&
                                      controller.recipesList.length % 20 == 0)
                                    Container(
                                      height: 40.h,
                                      margin: EdgeInsets.only(bottom: 30.h),
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator
                                          .adaptive(),
                                    )
                                ],
                              );
                            },
                          ),
                        )

                      // some state handling
                      else
                        const Expanded(
                            child: Center(child: Text('Nothing Found!')))
                    else if (controller.loadingStatus == LoadingStatus.loading)
                      Expanded(
                        child: Center(child: Lottie.asset(MyAssets.search)),
                      )
                    else
                      const Expanded(
                          child: Center(child: Text('Something went wrong!'))),
                  ],
                ),
              ),
              // for random recipe, and show lotte animation
              if (controller.loadingStatus == LoadingStatus.wait)
                const _RandomRecipeWait()
            ],
          );
        }),
      ),
    );
  }
}
