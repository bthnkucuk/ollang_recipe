import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ollang_recipe/components/my_media_query.dart';
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
            Image.asset(
              'assets/splash1.jpeg',
              height: MyMediaQuery.height,
              width: MyMediaQuery.width,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.colorBurn,
            ),
            Center(
              child: Container(
                height: MyMediaQuery.width / 1.8,
                width: MyMediaQuery.width / 1.8,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 7),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/splash2.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: (MyMediaQuery.width / 1.2)),
              alignment: Alignment.center,
              child: Text(
                'Ollang Recipe',
                style: s40W400(context).copyWith(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
