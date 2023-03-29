import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/my_app_bar.dart';
import '../controller/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(centerTitle: 'Favorite Screen'),
      body: Center(
        child: Text("Favorite Page"),
      ),
    );
  }
}
