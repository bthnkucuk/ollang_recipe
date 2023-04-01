part of '../view/detail_view.dart';

class _HealthLabels extends StatelessWidget {
  final List<String?> healthLabels;
  const _HealthLabels({required this.healthLabels});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Wrap(
          spacing: 4.w,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            healthLabels.length,
            (index) => Chip(
              elevation: 0,
              side: BorderSide.none,
              shape: const StadiumBorder(),
              labelStyle: s12W300(context),

              /// TODO renk temadan
              backgroundColor: Colors.green,
              label: Utf8EncodedText(
                healthLabels[index].toString(),
                style: s12W500(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
