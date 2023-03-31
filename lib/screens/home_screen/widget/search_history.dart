part of '../view/home_view.dart';

class _SearchHistory extends StatelessWidget {
  final bool isSearch;
  const _SearchHistory({super.key, required this.isSearch});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 1),
      height: isSearch ? 40.h : 0,
      width: MyMediaQuery.width,
      child: ColoredBox(
        color: Colors.transparent,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return FilterChip(
              elevation: 2,
              side: BorderSide.none,
              shape: const StadiumBorder(),
              labelStyle: s12W300(context),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              label: Text("ibdxas".toString()),
              onSelected: (value) {},
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 5.w),
        ),
      ),
    );
  }
}
