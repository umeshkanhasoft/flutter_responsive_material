import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'package:http/http.dart' as http;

class MoviesLogic extends GetxController {
  final MoviesState state = MoviesState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMovieList();
  }

  Future loadMovieList() async {
    state.isLoading.value = true;
    try {
      http.Response response = await fetchAlbum();
      var responseValue = jsonDecode(response.body);
      if (responseValue is Map &&
          responseValue.containsKey('AllMovieDataList')) {
        (responseValue['AllMovieDataList'] as List).forEach((element) {
          state.listOfMovieItem.add(element);
          state.filterMovieItem.add(element);
        });
      }
    } catch (e) {
      print(e);
    } finally {
      state.isLoading.value = false;
    }
  }

  filterValue(String searchText) {
    state.filterMovieItem.value = state.listOfMovieItem.where((item) {
      return (item['mn'] as String)
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
  }

  Widget getPageTitle() {
    return Text(
      "Movies",
      style: Theme.of(Get.context!).textTheme.titleLarge,
    );
  }

  Future<http.Response> fetchAlbum() async {
    return http.get(Uri.parse(
        'https://raw.githubusercontent.com/zsaergddtgdgt/ksnvbhsbvujcadgbvui/refs/heads/master/test.json'));
  }
}
