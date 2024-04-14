import 'package:ecommerce_firebase_getx/features/personalization/models/province_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityController extends GetxController {
  var cities = <Cities>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getCity();
  // }

  void getCity(int provinceId) async {
    final url =
        'https://api.rajaongkir.com/starter/city?province_id=${provinceId}&key=7345296077188acef49c4354561a5bbc';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = jsonResponse['rajaongkir']['results'] as List;
      cities.value = results.map((data) => Cities.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
