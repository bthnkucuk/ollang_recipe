import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';
import 'package:ollang_recipe/theme/text_style.dart';

class SingleRecipeWidget extends StatefulWidget {
  final bool isFavorite;

  final Recipe recipe;

  const SingleRecipeWidget(
      {super.key, this.isFavorite = false, required this.recipe});

  @override
  State<SingleRecipeWidget> createState() => _SingleRecipeWidgetState();
}

class _SingleRecipeWidgetState extends State<SingleRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      enabled: widget.isFavorite ? true : false,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
            onDismissed: (() =>
                Get.find<SessionServices>().deleteFavorite(widget.recipe))),
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
          color: Colors.white,
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
                child: Image.network(
                  widget.recipe.images!.thumbnail!.url ?? widget.recipe.image!,
                  fit: BoxFit.cover,
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
                      Text(widget.recipe.label ?? "Name",
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.local_fire_department_outlined,
                                    size: 20.w),
                                Text(
                                    "${(widget.recipe.calories ?? 0).floor()} Kcal",
                                    style: s9W400)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.schedule, size: 20.w),
                                Text('${widget.recipe.totalTime} Min',
                                    style: s9W400)
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
            IconButton(
                onPressed: (() {
                  Get.find<SessionServices>().saveFavorite(widget.recipe);
                  setState(() {
                    widget.recipe;
                  });
                }),
                icon: Icon(
                  Get.find<SessionServices>()
                              .hiveStorage
                              .user
                              .favorites
                              .firstWhereOrNull((element) =>
                                  element.label == widget.recipe.label) ==
                          null
                      ? Icons.favorite_border_sharp
                      : Icons.favorite,
                  color: Colors.black.withOpacity(0.5),
                  size: 27.w,
                ))
          ],
        ),
      ),
    );
  }
}
