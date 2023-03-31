part of '../view/detail_view.dart';

class _NutritionInfo extends StatelessWidget {
  final List<String> nutritionInfos;
  final List<IconData> nutrionIcons;
  const _NutritionInfo({
    required this.nutritionInfos,
    required this.nutrionIcons,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: nutritionInfos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 40.h,
        ),
        itemBuilder: (context, index) {
          var info = nutritionInfos[index];
          var icon = nutrionIcons[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Container(
                  height: double.maxFinite,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    info,
                    style: s14W500(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          );
        });
  }
}
