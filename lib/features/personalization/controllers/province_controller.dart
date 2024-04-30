import 'package:bliguh/features/personalization/models/province_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProvinceController extends GetxController {
  var renderList = 'provinces'.obs; // Make renderList observable
  var provinces = <Province>[].obs;
  var regencies = <Regencies>[].obs;
  var districts = <Districts>[].obs;
  var subDistricts = <SubDistricts>[].obs;
  // var cities = <Cities>[].obs;
  var provinceId = '31'.obs;
  var regencyId = '31.75'.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    renderList.value = 'provinces';
    fetchData();
  }

  final String RAJA_ONGKIR_API = '7345296077188acef49c4354561a5bbc';
  final String API_KEY_BINDER =
      'f1c259fb2e4208d3daf69d39cc0b27a0ac94890c802262488f617c7d457b8f45';
  final String URL_BYNDER = 'https://api.binderbyte.com/wilayah';
  //Bynder Bytes
  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final url = '${URL_BYNDER}/provinsi?api_key=${API_KEY_BINDER}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final results = jsonResponse['value'] as List;

        provinces.value =
            results.map((data) => Province.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getRegencies(String provinceId) async {
    try {
      isLoading.value = true;
      final url =
          '${URL_BYNDER}/kabupaten?api_key=${API_KEY_BINDER}&id_provinsi=$provinceId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final results = jsonResponse['value'] as List;
        regencies.value =
            results.map((data) => Regencies.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDistrict(String regencyId) async {
    try {
      isLoading.value = true;
      final url =
          "${URL_BYNDER}/kecamatan?api_key=${API_KEY_BINDER}&id_kabupaten=$regencyId";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final results = jsonResponse['value'] as List;
        districts.value =
            results.map((data) => Districts.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSubDistrict(String districtId) async {
    try {
      isLoading.value = true;
      final url =
          "${URL_BYNDER}/kelurahan?api_key=${API_KEY_BINDER}&id_kecamatan=$districtId";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final results = jsonResponse['value'] as List;
        subDistricts.value =
            results.map((data) => SubDistricts.fromJson(data)).toList();

        print(subDistricts);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateRenderList(String value) async {
    renderList.value = value;
    update();
  }

  void updateProvinceId(String value) {
    provinceId.value = value;
    update();
  }

  ///Raja ONGKIR
  // void fetchData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Check if data is already fetched and saved
  //   if (prefs.containsKey('provinces')) {
  //     // If data is saved, fetch from local storage
  //     List<String> storedData = prefs.getStringList('provinces')!;
  //     print(storedData);
  //     provinces.value = storedData
  //         .map((jsonString) => Province.fromJson(json.decode(jsonString)))
  //         .toList();
  //   } else {
  //     // If data is not saved, fetch from API
  //     final url =
  //         'https://api.rajaongkir.com/starter/province?key=${RAJA_ONGKIR_API}';
  //     final response = await http.get(Uri.parse(url));

  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final results = jsonResponse['rajaongkir']['results'] as List;
  //       print(results);
  //       provinces.value =
  //           results.map((data) => Province.fromJson(data)).toList();

  //       // Save fetched data to local storage
  //       List<String> jsonList = provinces
  //           .map((province) => json.encode(province.toJson()))
  //           .toList();
  //       prefs.setStringList('provinces', jsonList);
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   }
  // }

  // void getCity(String provinceId) async {
  //   final url =
  //       'https://api.rajaongkir.com/starter/city?province=$provinceId&key=$RAJA_ONGKIR_API';
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final jsonResponse = json.decode(response.body);
  //     final results = jsonResponse['rajaongkir']['results'] as List;
  //     cities.value = results.map((data) => Cities.fromJson(data)).toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Method to update renderList variable based on the tapped item
}
