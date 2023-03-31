import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/screens/splash_screen/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: const Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
