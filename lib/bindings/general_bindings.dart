import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
