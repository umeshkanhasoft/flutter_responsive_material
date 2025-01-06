import 'package:admin/screens/main/logic.dart';
import 'package:get/get.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
  }
}
