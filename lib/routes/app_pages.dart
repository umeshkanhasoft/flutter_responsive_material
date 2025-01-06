import 'package:admin/routes/app_routes.dart';
import 'package:admin/screens/main/binding.dart';
import 'package:admin/screens/main/view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.main, page: () => MainPage(), binding: MainBinding()),
  ];
}
