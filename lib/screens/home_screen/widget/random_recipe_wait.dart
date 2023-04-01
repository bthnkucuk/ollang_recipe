part of '../view/home_view.dart';

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
          child: LottieBuilder.asset('assets/dice.json'),
        ),
      ),
    );
  }
}
