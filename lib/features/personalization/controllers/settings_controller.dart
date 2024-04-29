import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isRefreshing = false.obs;

  Future<void> handleRefresh() async {
    isRefreshing.value = true;
    print("is refresinh ${isRefreshing.value}");
    // Simulate a long-running operation (e.g., fetching data from the network)
    await Future.delayed(Duration(seconds: 2000), () {
      // After the operation is complete, set isRefreshing to false
      isRefreshing.value = false;
      print("is refresinh ${isRefreshing.value}");
    });
  }
}
