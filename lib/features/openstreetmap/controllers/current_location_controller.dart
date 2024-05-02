import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/models/province_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CurrentLocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  final SelectionController regionController = Get.put(SelectionController());
  final ProvinceController provinceController = Get.put(ProvinceController());

  var kelurahan = ''.obs;
  var provinsi = ''.obs;
  var kab = ''.obs;
  var kec = ''.obs;

  Future<Position> getCoordinates() async {
    provinceController.isLoading.value = true;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        regionController.isLoading.value = false;
        if (permission == LocationPermission.denied) {
          provinceController.isLoading.value = false;
          throw Exception('Location permission denied by user');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        provinceController.isLoading.value = false;
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final lat = position.latitude;
      final lng = position.longitude;

      await getPlacemarks(lat, lng);

      provinceController.isLoading.value = false;
      return position;
    } catch (e) {
      provinceController.isLoading.value = false;
      print('Error getting location: $e');
      rethrow; // Rethrow the exception for handling at the caller's level
    }
  }

  Future<String> getPlacemarks(double lat, double long) async {
    try {
      // regionController.isLoading.value = true;
      // provinceController.isLoading.value = true;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      final String kelurahan;
      final String provinsi;
      final String kab;
      final String kec;

      var address = '';

      if (placemarks.isNotEmpty) {
        // Concatenate non-null components of the address
        var streets = placemarks.reversed
            .map((placemark) => placemark.street)
            .where((street) => street != null);

        // Filter out unwanted parts
        streets = streets.where((street) =>
            street!.toLowerCase() !=
            placemarks.reversed.last.locality!
                .toLowerCase()); // Remove city names
        streets = streets
            .where((street) => !street!.contains('+')); // Remove street codes

        address += streets.join(', ');
        kelurahan = placemarks.reversed.last.subLocality!;
        provinsi = placemarks.reversed.last.administrativeArea!.toUpperCase();
        kab = placemarks.reversed.last.subAdministrativeArea!;
        kec = placemarks.reversed.last.locality!;

        final String kabupaten = replaceFirstKabupatenWithKAB(kab);
        final String kecamatan = removeKecamatan(kec);

        final myProvinces = await provinceController.fetchData();

        final myProvince = myProvinces.firstWhere(
            (element) => element.province.contains(provinsi),
            orElse: () =>
                Province(provinceId: 'dfsfsdfsdf', province: 'kosong'));

        final myRegencies =
            await provinceController.getRegencies(myProvince.provinceId);

        final myRegency = myRegencies.firstWhere(
            (element) => element.city.contains(kabupaten),
            orElse: () => Regencies(city: 'dfsfsdfsdf', cityId: 'kosong'));

        regionController.listRegion.add(provinsi);
        regionController.activeIndex(0);

        print("sfsfsdf ${myRegency.cityId}--id regency");

        final myDistricts =
            await provinceController.getDistrict(myRegency.cityId);
        regionController.listRegion.add(kabupaten);
        regionController.activeIndex(1);

        final myDistrict = myDistricts.firstWhere(
            (element) => element.name.contains(kecamatan),
            orElse: () => Districts(id: 'dfsfsdfsdf', name: 'kosong'));
        regionController.listRegion.add(kecamatan);
        print(
            "my kecamatan $kecamatan District -${myDistricts[0].name}- ${myDistricts[0].id} id");
        regionController.activeIndex(3);
        provinceController.updateRenderList('subdistricts');

        regionController.listRegion.add('subdistricts');
        await provinceController.getSubDistrict(myDistrict.id);

        regionController.setActiveIndex(3);

        address += ', ${kelurahan}';
        address += ', ${kec}';
        address += ', ${kab}';
        address += ', ${provinsi}';
        address += ', ${placemarks.reversed.last.postalCode ?? ''}';
        address += ', ${placemarks.reversed.last.country ?? ''}';

        print("Administrative area $provinsi");
        print("Administrative kab $kabupaten");
        print("Administrative kec $kec");
        print("Administrative kel $kelurahan");
      }

      print("Your Address for ($lat, $long) is: $address");

      return address;
    } catch (e) {
      print("Error getting placemarks: $e");
      return "No Address";
    }
  }

  String replaceFirstKabupatenWithKAB(String input) {
    List<String> parts = input.split(" ");
    String modifiedString = "KAB. " + parts[1].toUpperCase();
    return modifiedString;
  }

  String removeKecamatan(String input) {
    // Check if the input starts with "Kecamatan"
    if (input.startsWith("Kecamatan ")) {
      // Remove "Kecamatan " from the input string
      return input.replaceFirst("Kecamatan ", "");
    } else {
      // If the input does not start with "Kecamatan", return the original string
      return input;
    }
  }

  String firstStringtoUpper(String input) {
    List<String> parts = input.split(" ");
    return parts[0].toUpperCase();
  }
}
