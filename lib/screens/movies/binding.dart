import 'package:get/get.dart';

import 'logic.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesLogic());
  }
}
