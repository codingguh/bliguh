import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isRefreshing = false.obs;

  Future<void> handleRefresh() async {
    isRefreshing.value = true;
    print("is refresinh ${isRefreshing.value}");
    isRefreshing.value = false;
  }
}
