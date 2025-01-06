import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/logic.dart';
import 'package:admin/screens/main/state.dart';
import 'package:admin/screens/main/widget/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      //common side mane for web,mobile, tablet
      drawer: SideMenu(
          position: state.selectedItemPosition,
          press: (int) => state.selectedItemPosition.value = int),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  position: state.selectedItemPosition,
                  press: (p0) => state.selectedItemPosition.value = p0,
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: logic.pageContent(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MainLogic>();
    super.dispose();
  }
}
