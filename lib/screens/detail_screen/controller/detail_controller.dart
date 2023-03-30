import 'package:get/get.dart';
import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/session_services.dart';

class DetailController extends GetxController {
  final Recipe recipe;
  DetailController(this.recipe);

  final session = Get.find<SessionServices>();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
