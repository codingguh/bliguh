import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRenderRegions extends StatelessWidget {
  const ListRenderRegions({
    super.key,
    required this.provinceController,
    required this.regionController,
    // required this.renderList,
  });

  final ProvinceController provinceController;
  final SelectionController regionController;
  // final RxString renderList; // Change to RxString

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (provinceController.provinces.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (provinceController.renderList.value == 'provinces') {
          return renderProvinceList();
        } else if (provinceController.renderList.value == 'cities') {
          return renderCityList();
        } else {
          return SizedBox(
            child: Text('Kecamatan'),
          );
        }
      }
    });
  }

  Widget renderCityList() {
    if (provinceController.cities.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      provinceController.cities.sort((a, b) => a.city.compareTo(b.city));
      String? firstLetter;
      List<Widget> listTiles = [];

      for (final city in provinceController.cities) {
        final currentLetter = city.city.substring(0, 1);
        if (firstLetter != currentLetter) {
          listTiles.add(
            InkWell(
              onTap: () {
                listTiles.clear();
                if (regionController.listRegion.length > 1) {
                  regionController.listRegion[1] = city.city;
                  regionController.listRegion.add('subdistrict');
                  // regionController.listRegion[2] = 'Select City';
                  provinceController.updateRenderList('subdistricts');
                  regionController
                      .setActiveIndex(regionController.listRegion.length - 1);
                  print(provinceController.renderList.value);
                } else {
                  regionController.listRegion.add(city.city);
                  regionController.listRegion
                      .add('${regionController.listRegion.length}');
                  regionController
                      .setActiveIndex(regionController.listRegion.length - 1);
                  provinceController.updateRenderList('subdistricts');
                  print(provinceController.renderList.value);
                }
              },
              child: ListTile(
                leading: Text(
                  currentLetter,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 197, 197, 197),
                  ),
                ),
                title: Text(
                  city.city,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );
          // Update the firstLetter variable
          firstLetter = currentLetter;
        } else {
          // Add a ListTile without the leading letter
          listTiles.add(
            InkWell(
              onTap: () {
                print(city.city);
                listTiles.clear();
                if (regionController.listRegion.length > 1) {
                  regionController.listRegion[1] = city.city;
                  regionController.listRegion[2] = 'Select City';
                  provinceController.updateRenderList('cities');
                  // provinceController.getCity(city.cityId); // Fetch cities
                  print(provinceController.renderList.value);
                } else {
                  regionController.listRegion.add(city.city);
                  regionController.listRegion.add('Select City');
                  regionController
                      .setActiveIndex(regionController.listRegion.length - 1);
                  provinceController.updateRenderList('cities');
                  provinceController.updateRenderList('cities');
                  // provinceController.getCity(city.cityId); // Fetch cities
                  print(provinceController.renderList.value);
                }
              },
              child: ListTile(
                leading: Text(''),
                title: Text(
                  city.city,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );
        }
      }
      // Wrap the list of ListTiles in a ListView
      return Expanded(child: ListView(children: listTiles));
    }
  }

  Widget renderProvinceList() {
    if (provinceController.provinces.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      // Sort the list of provinces alphabetically
      provinceController.provinces
          .sort((a, b) => a.province.compareTo(b.province));

      // Initialize a variable to keep track of the first letter
      String? firstLetter;

      // Create a list of widgets to hold the ListTile items
      List<Widget> listTiles = [];
      // Iterate over the sorted list of provinces
      for (final province in provinceController.provinces) {
        // Get the first letter of the province name
        final currentLetter = province.province.substring(0, 1);

        // Check if it's the first occurrence of this letter
        if (firstLetter != currentLetter) {
          // Add a ListTile with the leading letter
          listTiles.add(
            InkWell(
              onTap: () {
                listTiles.clear();
                if (regionController.listRegion.length > 1) {
                  regionController.listRegion[0] = province.province;
                  regionController.listRegion[1] = 'Select City';
                  // provinceController.cities.clear();
                  provinceController.updateRenderList('cities');
                  provinceController
                      .getCity(province.provinceId); // Fetch cities

                  // read
                  final myStringList =
                      regionController.setListRegion(region: province.province);

                  final getStringList = regionController.getAllListRegion();

                  print('Storing data $getStringList');
                } else {
                  listTiles.clear();
                  regionController.listRegion.add(province.province);
                  regionController.listRegion.add('Select City');
                  regionController
                      .setActiveIndex(regionController.listRegion.length - 1);
                  // provinceController.cities.clear();
                  provinceController.updateRenderList('cities');
                  provinceController
                      .getCity(province.provinceId); // Fetch cities
                  print(provinceController.renderList.value);

                  final myStringList =
                      regionController.setListRegion(region: province.province);
                  final getStringList = regionController.getAllListRegion();

                  print('Storing data $getStringList');
                }
              },
              child: ListTile(
                leading: Text(
                  currentLetter,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 197, 197, 197),
                  ),
                ),
                title: Text(
                  province.province,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );

          // Update the firstLetter variable
          firstLetter = currentLetter;
        } else {
          // Add a ListTile without the leading letter
          listTiles.add(
            InkWell(
              onTap: () {
                listTiles.clear();
                if (regionController.listRegion.length > 1) {
                  regionController.listRegion[0] = province.province;
                  regionController.listRegion[1] = 'Select City';
                  // provinceController.cities.clear();
                  provinceController.updateRenderList('cities');
                  print('id provinces ${province.provinceId}');
                  provinceController
                      .getCity(province.provinceId); // Fetch cities
                  print(provinceController.renderList.value);
                } else {
                  listTiles.clear();
                  regionController.listRegion.add(province.province);
                  regionController.listRegion.add('Select City');
                  // provinceController.cities.clear();
                  regionController
                      .setActiveIndex(regionController.listRegion.length - 1);
                  provinceController
                      .getCity(province.provinceId); // Fetch cities
                  provinceController.updateRenderList('cities');

                  print(provinceController.renderList.value);
                }
              },
              child: ListTile(
                leading: Text(''),
                title: Text(
                  province.province,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );
        }
      }

      // Wrap the list of ListTiles in a ListView
      return Expanded(child: ListView(children: listTiles));
    }
  }
}
