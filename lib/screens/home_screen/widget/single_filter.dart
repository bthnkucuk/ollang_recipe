part of '../view/filter_view.dart';

class _SingleFilter extends StatelessWidget {
  final String filterName;
  final Function(String, FilterTypes) onChipTap;
  final List<String> chipList;
  final List<String> selectedChipList;
  final FilterTypes filterType;

  const _SingleFilter({
    required this.filterName,
    required this.onChipTap,
    required this.chipList,
    required this.filterType,
    required this.selectedChipList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(filterName, style: s18W600(context)),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 6.w,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(chipList.length, (index) {
            var isSelected = selectedChipList.contains(chipList[index]);
            return FilterChip(
              checkmarkColor: Colors.green,
              elevation: isSelected ? 2 : 0,
              side: BorderSide.none,
              shape: const StadiumBorder(),
              labelStyle: s12W300(context),
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                chipList[index],
                style: s12W500(context).copyWith(color: isSelected ? Colors.green : Colors.white),
              ),
              onSelected: (value) => onChipTap(chipList[index], filterType),
              selected: isSelected,
            );
          }),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
