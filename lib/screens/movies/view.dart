import 'package:admin/constants.dart';
import 'package:admin/screens/main/widget/header.dart';
import 'package:admin/screens/movies/widget/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MoviesPage extends StatelessWidget {
  final MoviesLogic logic = Get.put(MoviesLogic());
  final MoviesState state = Get.find<MoviesLogic>().state;

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
          MoviesItem(listOfMovie: state.filterMovieItem)
        ]),
      ),
    );
  }
}
