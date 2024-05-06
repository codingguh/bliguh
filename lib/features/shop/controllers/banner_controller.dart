import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/banners/banner_repository.dart';
import 'package:bliguh/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

//Update page navigation data
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  ///Fetch Banners
  Future<void> fetchBanners() async {
    try {
      //Show Loader while loading categories
      isLoading.value = true;

      //fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString);
    } finally {
      isLoading.value = false;
      print('FIMAYBFJDSFKSMDKSDKGMKGD ${isLoading.value}');
    }
  }
}
