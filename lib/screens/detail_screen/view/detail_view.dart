import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_media_query.dart';
import 'package:ollang_recipe/components/utf8_encoded_text.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:screenshot/screenshot.dart';
import '../../../components/my_error_widget.dart';
import '../../../components/my_network_image.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style.dart';
import '../controller/detail_controller.dart';

part '../widget/detail_info.dart';
part '../widget/nutrition_info.dart';
part '../widget/ingredients_info.dart';
part '../widget/health_labels.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      key: UniqueKey(),
      controller: controller.screenshotController,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        key: controller.scaffoldKey,
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            // image and recipe info
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              title: Obx(
                () => Opacity(
                    opacity: 1 - controller.scrollRange.value,
                    child: const Text('Recipe Detail')),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () => controller.share(),
                      icon: const Icon(Icons.share_outlined)),
                )
              ],
              pinned: true,
              expandedHeight: MyMediaQuery.height * .4,
              floating: false,
              leading: GestureDetector(
                onTap: () => controller.goBack(),
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: controller.image != null

                    /// Hero widget for animation
                    ? Hero(
                        tag: controller.recipe.uri!,
                        child: MyNetworkImage(url: controller.image),
                      )
                    : const SizedBox(),
                collapseMode: CollapseMode.parallax,
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(kToolbarHeight + MyMediaQuery.padding.top),
                child: Obx(() => Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              30 * controller.scrollRange.value),
                        ),
                      ),
                      padding:
                          EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
                      width: MyMediaQuery.width,
                      height: 100.h,
                      child: _DetailInfo(
                        recipeName: controller.recipe.label,
                        calories: controller.recipe.calories,
                        duration: controller.recipe.totalTime,
                        starCount: controller.recipe.recipeYield,
                        isFavorite: controller.recipe.isFavorite,
                        onFavoritePressed: () => controller.saveFav(),
                      ),
                    )),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            // nutrition info
            _NutritionInfo(
              nutritionInfos: controller.nutritionInfos,
              nutrionIcons: controller.nutrionIcons,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Ingredients',
                  style: s16W600(context),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 5.h)),
            if (controller.recipe.ingredients != null)
              // ingredients info
              _IngredientsInfo(ingredients: controller.recipe.ingredients!)
            else
              const SliverToBoxAdapter(
                child: MyErrorWidget(
                  error: 'Ingredints Not Found!',
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Healt Labels',
                  style: s16W600(context),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 5.h)),
            if (controller.recipe.healthLabels != null)
              _HealthLabels(healthLabels: controller.recipe.healthLabels!)
            else
              const SliverToBoxAdapter(
                child: MyErrorWidget(
                  error: 'Health Labels Not Found!',
                ),
              ),
            SliverToBoxAdapter(
                child: SizedBox(height: MyMediaQuery.padding.bottom * 3)),
          ],
        ),
      ),
    );
  }
}
