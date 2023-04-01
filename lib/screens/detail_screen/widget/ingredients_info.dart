part of '../view/detail_view.dart';

class _IngredientsInfo extends StatelessWidget {
  final List<Ingredient> ingredients;
  const _IngredientsInfo({
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: ingredients.length,
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: MyNetworkImage(
                      url: ingredients[index].image,
                      height: 40.w,
                      width: 40.w,
                    )),
                SizedBox(width: 5.w),
                Expanded(
                  child: Utf8EncodedText(
                    ingredients[index].text,
                    style: s12W500(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
