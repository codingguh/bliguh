import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/categories/category.repository.dart';
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

      featuredCategories
          .assignAll(allCategories.where((category) => category.isFeatured));

      print("VALUE ${featuredCategories[3].name}");
      // return featuredCategories;
      // print('categories jk ${categories[0].name}');
      // // Update the categories list
      // allCategories.assignAll(categories);
      // //Filter featured categories
      // print('isess ${featuredCategories}');
      // print('all isess ${allCategories[0].name}');
      // print('isess featured ${featuredCategories[0].name}');
      // print('isess fwffs ALL ${allCategories[0].name}');
      // return featuredCategories.assignAll(allCategories
      //     .where((category) => category.isFeatured)
      //     .take(8)
      //     .toList());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString);
      // throw 'edfsdfsdf EE $e';
      // print('isess ${e}');
    } finally {
      isLoading.value = false;
      print('FIMAYBFJDSFKSMDKSDKGMKGD ${isLoading.value}');
    }
  }

  /// --Load selected category data

  /// Get Category or Sub Category Products
}
