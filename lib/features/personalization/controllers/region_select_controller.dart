import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionController extends GetxController {
  RxList<bool> isSelectedList = <bool>[].obs;
  RxList<String> listRegion = <String>[].obs;
  RxBool isLastIndexActiveInitially = true.obs;
  RxBool isLoading = false.obs;

  RxInt activeIndex = RxInt(0); // Initialize with 0 as the default active index

  @override
  void onInit() {
    super.onInit();
    activeIndex.value =
        isSelectedList.length; // Set the default active index to the last index
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }

  Future getAllListRegion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('list_region') ?? [];
  }

  Future setListRegion({required String region}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list_region', [region]);
  }

  void initSelectionList(int length) {
    isSelectedList.assignAll(List<bool>.filled(length, false));
  }

  void clearListRegion() {
    listRegion.clear();
    // activeIndex.value = 0.obs;
    isLastIndexActiveInitially = false.obs;
  }
}
