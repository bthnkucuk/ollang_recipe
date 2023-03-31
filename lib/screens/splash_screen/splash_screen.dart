import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/screens/splash_screen/controller/splash_controller.dart';
import 'package:ollang_recipe/screens/splash_screen/view/splash_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => const SplashView(),
    );
  }
}
