import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:flutter/material.dart';

Widget renderProvinceList(ProvinceController provinceController,
    SelectionController regionController) {
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
                regionController.listRegion[1] = 'Select Regency';
                provinceController.updateRenderList('regencies');
                provinceController
                    .getRegencies(province.provinceId); // Fetch cities
              } else {
                listTiles.clear();
                regionController.listRegion.add(province.province);
                regionController.listRegion.add('Select Regency');
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                provinceController.updateRenderList('regencies');
                provinceController
                    .getRegencies(province.provinceId); // Fetch cities
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
                regionController.listRegion[1] = 'Select Regency';
                // provinceController.cities.clear();
                provinceController.updateRenderList('regencies');
                print('id provinces ${province.provinceId}');
                provinceController
                    .getRegencies(province.provinceId); // Fetch cities
                print(provinceController.renderList.value);
              } else {
                listTiles.clear();
                regionController.listRegion.add(province.province);
                regionController.listRegion.add('Select Regency');
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                provinceController
                    .getRegencies(province.provinceId); // Fetch cities
                provinceController.updateRenderList('regencies');
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

Widget renderRegencyList(ProvinceController provinceController,
    SelectionController regionController) {
  if (provinceController.regencies.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    provinceController.regencies.sort((a, b) => a.city.compareTo(b.city));
    String? firstLetter;
    List<Widget> listTiles = [];

    for (final city in provinceController.regencies) {
      final currentLetter = city.city.substring(5, 6);
      if (firstLetter != currentLetter) {
        listTiles.add(
          InkWell(
            onTap: () {
              listTiles.clear();
              if (regionController.listRegion.length <= 2) {
                regionController.listRegion[1] = city.city;

                regionController.listRegion.add('Select District');

                print('id provinces ${city.cityId}');

                regionController.setActiveIndex(2);
                provinceController.updateRenderList('districts');

                provinceController.getDistrict(city.cityId); // Fetch cities
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                print(provinceController.districts);
              } else {
                // listTiles.clear();
                print("apakah ini ${regionController.listRegion.length}");
                print(provinceController.districts);
                regionController.listRegion[1] = city.city;
                provinceController.getDistrict(city.cityId); // Fetch cities
                regionController.listRegion[2] = 'districts';
                print("apakah ini ${regionController.listRegion[2]}");
                // regionController.listRegion.removeLast();
                provinceController.updateRenderList('districts');
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
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
              if (regionController.listRegion.length < 2) {
                regionController.listRegion.add(city.city);
                regionController.listRegion.add('Select District');
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                provinceController.getDistrict(city.cityId); // Fetch cities
                provinceController.updateRenderList('districts');
              } else {
                regionController.listRegion[1] = city.city;
                regionController.listRegion[2] = 'Select District';
                provinceController.updateRenderList('districts');
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

Widget renderDistrictList(ProvinceController provinceController,
    SelectionController regionController) {
  provinceController.updateRenderList('districts');
  if (provinceController.districts.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    return Text('kontol');
  }
}
