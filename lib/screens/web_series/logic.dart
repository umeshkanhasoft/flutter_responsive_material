import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';
import 'package:http/http.dart' as http;

class WebSeriesLogic extends GetxController {
  final WebSeriesState state = WebSeriesState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadWebSeriesList();
  }

  //fetching webservice data from rest api
  Future loadWebSeriesList() async {
    state.isLoading.value = true;
    try {
      http.Response response = await fetchAlbum();
      var responseValue = jsonDecode(response.body);
      if (responseValue is Map &&
          responseValue.containsKey('webSeriesDataList')) {
        (responseValue['webSeriesDataList'] as List).forEach((element) {
          state.listOfSeriesItem.add(element);
          state.filterSeriesItem.add(element);
        });
        state.listOfSeriesItem.value = state.listOfSeriesItem.reversed.toList();
        state.filterSeriesItem.value = state.filterSeriesItem.reversed.toList();
      }
    } catch (e) {
      print(e);
    } finally {
      state.isLoading.value = false;
    }
  }

  filterValue(String searchText) {
    state.filterSeriesItem.value = state.listOfSeriesItem.where((item) {
      return (item['mn'] as String)
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
  }

  Widget getPageTitle() {
    return Text(
      "Web Series",
      style: Theme.of(Get.context!).textTheme.titleLarge,
    );
  }

  Future<http.Response> fetchAlbum() async {
    return http.get(Uri.parse(
        'https://raw.githubusercontent.com/zsaergddtgdgt/ksnvbhsbvujcadgbvui/refs/heads/master/srs.json'));
  }
}
