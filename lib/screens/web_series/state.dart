import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WebSeriesState {
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> listOfSeriesItem = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filterSeriesItem = <Map<String, dynamic>>[].obs;
  Function(String search)? onChange;

  WebSeriesState() {
    ///Initialize variables
  }
}
