import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/favorite_controller.dart';
import 'view/favorite_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller) => const FavoriteView(),
    );
  }
}
