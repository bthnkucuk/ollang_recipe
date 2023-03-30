import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';

import 'controller/detail_controller.dart';
import 'view/detail_view.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(recipe),
      builder: (controller) => const DetailView(),
    );
  }
}
