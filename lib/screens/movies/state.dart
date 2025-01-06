import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MoviesState {
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> listOfMovieItem = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filterMovieItem = <Map<String, dynamic>>[].obs;
  Function(String search)? onChange;

  MoviesState() {
    ///Initialize variables
    listOfMovieItem.value = [];
    filterMovieItem.value = [];
    onChange = (s) {
      print(s);
      if (s.isNotEmpty == true) {
        filterMovieItem.value = listOfMovieItem.where((item) {
          return (item['mn'] as String).toLowerCase().contains(s.toLowerCase());
        }).toList();
      }
    };
  }
}
