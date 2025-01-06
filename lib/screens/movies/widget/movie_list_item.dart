import 'package:admin/constants.dart';
import 'package:admin/utils/widget/comman_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({
    Key? key,
    required this.listOfMovie,
  }) : super(key: key);

  final RxList<Map<String, dynamic>> listOfMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // current tab title
          Text(
            "Movies List",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: defaultPadding),

          // Base on calculate screen high to showing grid
          SizedBox(
            width: double.infinity,
            height: Get.height - (defaultPadding * 12),
            child: Obx(
              () => ResponsiveGridList(
                listViewBuilderOptions: ListViewBuilderOptions(
                  shrinkWrap: true,
                ),
                minItemWidth: double.infinity,
                verticalGridSpacing: 10,
                horizontalGridSpacing: 10,
                minItemsPerRow: 3,
                children:
                    listOfMovie.map((e) => CommonCell(element: e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
