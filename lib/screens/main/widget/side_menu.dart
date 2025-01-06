import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, required this.position, required this.press})
      : super(key: key);
  final Function(int) press;
  final RxInt position;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          Obx(
            () => DrawerListTile(
              isSelected: position.value == 0,
              title: "Movies",
              svgSrc: "assets/icons/menu_dashboard.svg",
              press: () {
                Get.back();
                press(0);
              },
            ),
          ),
          Obx(() => DrawerListTile(
                isSelected: position.value == 1,
                title: "Web Series",
                svgSrc: "assets/icons/menu_tran.svg",
                press: () {
                  Get.back();
                  press(1);
                },
              )),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
            isSelected ? primaryColor : Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? primaryColor : Colors.white54),
      ),
    );
  }
}
