import 'package:ecommerce_firebase_getx/features/personalization/models/province_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProvinceController extends GetxController {
  var renderList = 'provinces'.obs; // Make renderList observable
  var provinces = <Province>[].obs;
  var cities = <Cities>[].obs;
  var provinceId = '2'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  final String RAJA_ONGKIR_API = '7345296077188acef49c4354561a5bbc';

  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if data is already fetched and saved
    if (prefs.containsKey('provinces')) {
      // If data is saved, fetch from local storage
      List<String> storedData = prefs.getStringList('provinces')!;
      print(storedData);
      provinces.value = storedData
          .map((jsonString) => Province.fromJson(json.decode(jsonString)))
          .toList();
    } else {
      // If data is not saved, fetch from API
      final url =
          'https://api.rajaongkir.com/starter/province?key=${RAJA_ONGKIR_API}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final results = jsonResponse['rajaongkir']['results'] as List;
        print(results);
        provinces.value =
            results.map((data) => Province.fromJson(data)).toList();

        // Save fetched data to local storage
        List<String> jsonList = provinces
            .map((province) => json.encode(province.toJson()))
            .toList();
        prefs.setStringList('provinces', jsonList);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  void getCity(String provinceId) async {
    final url =
        'https://api.rajaongkir.com/starter/city?province=$provinceId&key=$RAJA_ONGKIR_API';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = jsonResponse['rajaongkir']['results'] as List;
      cities.value = results.map((data) => Cities.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Method to update renderList variable based on the tapped item
  void updateRenderList(String value) {
    renderList.value = value;
  }

  void updateProvinceId(String value) {
    provinceId.value = value;
  }
}
