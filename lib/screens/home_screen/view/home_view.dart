import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/material_app_updater.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
        leading: Icon(Icons.light_mode_outlined),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.loadingStatus.value == LoadingStatus.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (controller.loadingStatus.value == LoadingStatus.loaded) {
            return const Center(child: Text("Screen Status loaded"));
          } else {
            return const SizedBox();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        MaterialAppInheritedWidget.of(context).changeTheme();
      }),
    );
  }
}
