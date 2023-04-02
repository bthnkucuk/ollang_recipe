import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ollang_recipe/components/my_media_query.dart';
import 'package:ollang_recipe/core/assets.dart';
import 'package:ollang_recipe/screens/splash_screen/controller/splash_controller.dart';
import 'package:ollang_recipe/theme/text_style.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Lottie.asset(
                    MyAssets.splashAnimation,
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: MyMediaQuery.padding.bottom),
                width: MyMediaQuery.width,
                height: 200,
                child: Text(
                  'Ollang Recipe',
                  style: s20W400(context),
                ),
              ),
            ),
          ],
        ));
  }
}
