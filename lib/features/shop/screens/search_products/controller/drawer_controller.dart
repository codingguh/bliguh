import 'package:get/get.dart';

class DrawerController extends GetxController {
  RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.toggle(); // Toggle the value
  }
}
