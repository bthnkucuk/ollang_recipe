import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';

import '../../../components/my_app_bar.dart';
import '../../../components/single_recipe_widget.dart';
import '../controller/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(centerTitle: 'Favorite Screen'),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                              isFavorite: true,
                              recipe: controller.recipiesList[index],
                            ),
                            SizedBox(height: 10.h)
                          ],
                        );
                      },
                    ),
                  )
                else
                  const Expanded(child: Center(child: Text("Nothing found!")))
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
    );
  }
}
