import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_media_query.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:share_plus/share_plus.dart';
import '../../../components/my_error_widget.dart';
import '../../../components/my_network_image.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      key: controller.scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () => controller.share(),
                    icon: Icon(Icons.share_outlined)),
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
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
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
    );
  }
}
