import 'package:admin/constants.dart';
import 'package:admin/screens/main/widget/header.dart';
import 'package:admin/screens/web_series/widget/web_series_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class WebSeriesPage extends StatefulWidget {
  const WebSeriesPage({Key? key}) : super(key: key);

  @override
  State<WebSeriesPage> createState() => _WebSeriesPageState();
}

class _WebSeriesPageState extends State<WebSeriesPage> {
  final WebSeriesLogic logic = Get.put(WebSeriesLogic());
  final WebSeriesState state = Get.find<WebSeriesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Header(
              titleWidget: logic.getPageTitle(),
              onChanged: (search) {
                logic.filterValue(search);
              }),
          SizedBox(height: defaultPadding),
          WebSeriesItem(listOfWebSeries: state.filterSeriesItem)
        ]),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WebSeriesLogic>();
    super.dispose();
  }
}
