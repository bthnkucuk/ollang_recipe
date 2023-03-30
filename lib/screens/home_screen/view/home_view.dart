import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_input_field.dart';
import 'package:ollang_recipe/components/single_recipe_widget.dart';

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
                children: [
                  Text(
                    "Screen Status loaded",
                    style: s18W700,
                  ),
                  MyInputField(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: () => controller.filterSearch(),
                        child: const Icon(Icons.tune_outlined)),
                    hintText: "hintText",
                    onSubmitted: (p) {
                      controller.search(p);
                    },
                  ),
                  if (controller.loadingStatus == LoadingStatus.loaded)
                    if (controller.recipiesList.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.recipiesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                if (index == 0) SizedBox(height: 20.h),
                                SingleRecipeWidget(
                                  recipe:
                                      controller.recipiesList[index].recipe!,
                                ),
                                SizedBox(height: 10.h)
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
