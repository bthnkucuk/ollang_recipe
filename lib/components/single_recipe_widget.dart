import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_network_image.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/theme/text_style.dart';

///[SingleRecipeWidget] is a widget that displays a single recipe.
class SingleRecipeWidget extends StatelessWidget {
  final bool isDismissible;
  final VoidCallback? onFavIconTap;
  final VoidCallback? onDelete;

  final Recipe recipe;

  const SingleRecipeWidget(
      {super.key, this.isDismissible = false, required this.recipe, this.onFavIconTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      enabled: isDismissible ? true : false,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
            onDismissed: onDelete ??
                () {
                  print("object");
                }),
        children: [
          SlidableAction(
            onPressed: ((_) {
              print("object");
            }),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Recipe Image

            ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: AspectRatio(
                aspectRatio: 90 / 75,
                child: Hero(
                  tag: recipe.uri!,
                  child: MyNetworkImage(
                    url: recipe.images!.thumbnail!.url ?? recipe.image,
                  ),
                ),
              ),
            ),

            SizedBox(width: 10.w),

            //Recipe Information
            Expanded(
              child: ColoredBox(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.label ?? "----", maxLines: 1, overflow: TextOverflow.ellipsis),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department_outlined,
                                  size: 20.w,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                SizedBox(width: 5.w),
                                Text("${(recipe.calories ?? 0).floor()} Kcal", style: s9W400(context))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 20.w,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                SizedBox(width: 5.w),
                                Text('${recipe.totalTime} Min', style: s9W400(context))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Favorite icon
            if (!isDismissible)
              Obx(() => IconButton(
                  onPressed: onFavIconTap,
                  icon: Icon(
                    !recipe.isFavorite.value ? Icons.favorite_border_sharp : Icons.favorite,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 27.w,
                  )))
          ],
        ),
      ),
    );
  }
}
