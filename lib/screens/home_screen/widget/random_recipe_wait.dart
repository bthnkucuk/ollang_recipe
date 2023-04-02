part of '../view/home_view.dart';

// for random recipe animation when user tap on the dice icon
class _RandomRecipeWait extends StatelessWidget {
  const _RandomRecipeWait();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MyMediaQuery.width,
      height: MyMediaQuery.height,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: FractionallySizedBox(
          widthFactor: 0.4,
          child: LottieBuilder.asset(MyAssets.dice),
        ),
      ),
    );
  }
}
