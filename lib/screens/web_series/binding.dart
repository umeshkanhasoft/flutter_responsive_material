import 'package:get/get.dart';

import 'logic.dart';

class WebSeriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebSeriesLogic());
  }
}
