part of '../view/detail_view.dart';

class _DetailInfo extends StatelessWidget {
  final String? recipeName;
  final num? calories;
  final num? duration;
  final num? starCount;
  final RxBool? isFavorite;
  final VoidCallback onFavoritePressed;

  const _DetailInfo({
    this.recipeName,
    this.calories,
    this.duration,
    this.starCount,
    this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: Text(
                  recipeName ?? "----",
                  style: s24W600(context).copyWith(fontSize: 30),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: GestureDetector(

                    /// TODO: fava kaydet.
                    onTap: null,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onFavoritePressed,
                        icon: Obx(
                          () => Icon(
                            isFavorite!.value == false
                                ? Icons.favorite_border_sharp
                                : Icons.favorite,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 30.w,
                          ),
                        ))),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      size: 20.w,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: 5.w),
                    Text("${(calories ?? 0).floor()} Kcal",
                        style: s9W400(context))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 20.w,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: 5.w),
                    Text('$duration Min', style: s9W400(context))
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 20.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var count = starCount ?? 0;
                      if (count > 5) count = count / 2;
                      count = count.floor();

                      return Icon(
                        Icons.star_purple500_outlined,
                        color: index < count ? Colors.amber : Colors.grey,
                        size: 20.h,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
