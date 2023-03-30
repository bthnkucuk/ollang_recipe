import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/my_app_bar.dart';
import '../controller/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(centerTitle: 'Detail Screen'), body: Center());
  }
}
