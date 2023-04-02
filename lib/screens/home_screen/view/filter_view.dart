import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/utf8_encoded_text.dart';
import 'package:ollang_recipe/screens/home_screen/controller/home_controller.dart';
import '../../../theme/text_style.dart';

part '../widget/single_filter.dart';

enum FilterTypes { dishType, mealType, cuisineType, health }

class FilterView extends GetView<HomeController> {
  const FilterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SingleFilter(
              chipList: controller.getFilter(FilterTypes.dishType),
              // ignore: invalid_use_of_protected_member
              selectedChipList: controller.dishTypeSelectedList.value,
              filterName: 'Dish Type',
              filterType: FilterTypes.dishType,
              onChipTap: (chip, type) => controller.saveFilter(chip, type),
            ),
            SizedBox(height: 20.h),
            _SingleFilter(
              chipList: controller.getFilter(FilterTypes.mealType),
              // ignore: invalid_use_of_protected_member
              selectedChipList: controller.mealTypeSelectedList.value,
              filterName: 'Meal Type',
              filterType: FilterTypes.mealType,
              onChipTap: (chip, type) => controller.saveFilter(chip, type),
            ),
            _SingleFilter(
              chipList: controller.getFilter(FilterTypes.health),
              // ignore: invalid_use_of_protected_member
              selectedChipList: controller.healtSelectedList.value,
              filterName: 'Health',
              filterType: FilterTypes.health,
              onChipTap: (chip, type) => controller.saveFilter(chip, type),
            ),
            Text('Time', style: s18W600(context)),
            SizedBox(height: 10.h),
            RangeSlider(
              divisions: 100,
              inactiveColor: Colors.grey,
              labels: RangeLabels(controller.timeStart.value.round().toString(),
                  controller.timeEnd.value.round().toString()),
              min: 0.0,
              max: 300.0,
              values: RangeValues(
                  controller.timeStart.value, controller.timeEnd.value),
              onChanged: (values) {
                controller.timeStart(values.start);
                controller.timeEnd(values.end);
              },
            ),
            SizedBox(height: 20.h),
            _SingleFilter(
              chipList: controller.getFilter(FilterTypes.cuisineType),
              // ignore: invalid_use_of_protected_member
              selectedChipList: controller.cuisineTypeSelectedList.value,
              filterName: 'Cuisine Type',
              filterType: FilterTypes.cuisineType,
              onChipTap: (chip, type) => controller.saveFilter(chip, type),
            ),
            ElevatedButton(
              onPressed: () => controller.applyFilter(),
              child: Text(
                'Apply',
                style: s20W500(context).copyWith(color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () => controller.clearFilters(),
                child: const Text('Clear All Filters')),
          ],
        ),
      ),
    );
  }
}
