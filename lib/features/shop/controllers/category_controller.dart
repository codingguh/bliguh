import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/categories/category_repository.dart';
import 'package:bliguh/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      //Show Loader while loading categories
      isLoading.value = true;
      // fetch categories from data source (FirestoremAPI,etc)
      final categories = await _categoryRepository.getAllCategories();

      featuredCategories.value = categories;

      allCategories.assignAll(categories);

      // featuredCategories
      //     .assignAll(allCategories.where((category) => category.isFeatured));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString);
    } finally {
      isLoading.value = false;
      print('FIMAYBFJDSFKSMDKSDKGMKGD ${isLoading.value}');
    }
  }

  /// --Load selected category data

  /// Get Category or Sub Category Products
}
