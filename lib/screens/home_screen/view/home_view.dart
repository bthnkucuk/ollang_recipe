import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/single_recipe_widget.dart';

import '../../../components/my_app_bar.dart';
import '../../../theme/text_style.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey,
        appBar: MyAppBar(
          centerTitle: 'Ollang Recipe',
          leadingIcon: controller.themeIcon.value,
          leadingOnPressed: controller.changeTheme,
          trailingIcon: Icons.favorite_outline_outlined,
          trailingOnPressed: controller.goFavorite,
        ),
        body: SafeArea(
          child: Obx(() {
            if (controller.loadingStatus.value == LoadingStatus.loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (controller.loadingStatus.value == LoadingStatus.loaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Screen Status loaded",
                      style: s18W700,
                    ),
                    Column(
                        children:
                            List.generate(5, (index) => SingleRecipeWidget()))
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
