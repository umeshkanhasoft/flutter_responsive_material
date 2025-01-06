import 'package:admin/screens/movies/view.dart';
import 'package:admin/screens/web_series/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  Widget pageContent() {
    return Obx(() {
      switch (state.selectedItemPosition.value) {
        case 0:
          return MoviesPage();
        case 1:
          return WebSeriesPage();
        default:
          return MoviesPage();
      }
    });
  }
}
