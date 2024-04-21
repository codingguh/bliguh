import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/atoms/active_list_tile_district%20copy.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/atoms/active_list_tile_district.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/atoms/active_list_tile_province.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/atoms/active_list_tile_region.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget renderProvinceList(ProvinceController provinceController,
    SelectionController regionController) {
  if (provinceController.isLoading.value) {
    // Show loading indicator while data is being fetched
    return Center(child: CircularProgressIndicator());
  } else if (provinceController.provinces.isEmpty) {
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
                // if (regionController.listRegion.length > 1 &&
                //     regionController.listRegion.length < 2) {
                //   regionController.listRegion.removeRange(1, 2);
                // }
                regionController.listRegion[0] = province.province;
                regionController.listRegion[1] = 'Select Regency';
                provinceController.updateRenderList('regencies');
                provinceController
                    .getRegencies(province.provinceId); // Fetch cities
              } else {
                listTiles.clear();

                regionController.listRegion.add(province.province);
                regionController.listRegion.add('Select Regency jokies');
                regionController.setActiveIndex(1);
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
              title: regionController.listRegion.length > 0 &&
                      province.province == regionController.listRegion[0]
                  ? ActiveListTileProvince(province: province)
                  : Text(
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
                regionController.listRegion[1] = 'Select Regency aku';

                regionController.setActiveIndex(1);
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
            child: Obx(
              () => ListTile(
                leading: Text(''),
                title: regionController.listRegion.length != 0 &&
                        province.province == regionController.listRegion[0]
                    ? ActiveListTileProvince(province: province)
                    : Text(
                        province.province,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
  if (provinceController.isLoading.value) {
    // Show loading indicator while data is being fetched
    return Center(child: CircularProgressIndicator());
  } else if (provinceController.regencies.isEmpty) {
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

                regionController.listRegion.add('Select District komu');

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
                regionController.setActiveIndex(2);
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(currentLetter),
                title: regionController.listRegion.length != 1 &&
                        city.city == regionController.listRegion[1]
                    ? ActiveListTileRegion(
                        city: city,
                      )
                    : Text(
                        city.city,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
                // regionController.listRegion.add('Select District koi');
                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                provinceController.getDistrict(city.cityId); // Fetch cities
                provinceController.updateRenderList('districts');
              } else {
                regionController.listRegion[1] = city.city;
                provinceController.updateRenderList('districts');
                provinceController.getDistrict(city.cityId);
                // regionController.listRegion.add('Select District koi');
                regionController.setActiveIndex(2);
                regionController.listRegion[2] = 'Select District hh';
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(''),
                title: regionController.listRegion.length != 1 &&
                        city.city == regionController.listRegion[1]
                    ? ActiveListTileRegion(
                        city: city,
                      )
                    : Text(
                        city.city,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
  if (provinceController.isLoading.value) {
    // Show loading indicator while data is being fetched
    return Center(child: CircularProgressIndicator());
  } else if (provinceController.districts.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    provinceController.districts.sort((a, b) => a.name.compareTo(b.name));
    String? firstLetter;
    List<Widget> listTiles = [];

    for (final district in provinceController.districts) {
      final currentLetter = district.name.substring(0, 1);
      if (firstLetter != currentLetter) {
        listTiles.add(
          InkWell(
            onTap: () {
              listTiles.clear();
              if (regionController.listRegion.length < 3) {
                regionController.listRegion[2] = district.name;

                regionController.listRegion.add('Select SubDistrict');

                provinceController.getSubDistrict(district.id);
                print('id provinces ${district.name}');

                regionController.setActiveIndex(3);
                provinceController.updateRenderList('subdistricts');

                print(provinceController.districts);
              } else {
                // listTiles.clear();

                // provinceController.getDistrict(city.cityId); // Fetch cities

                // regionController.listRegion[3] = 'subdistricts';
                if (regionController.listRegion.length <= 3) {
                  regionController.listRegion.add('Select Subdistrict koi');
                }

                regionController.setActiveIndex(3);
                provinceController.getSubDistrict(district.id);
                regionController.listRegion[2] = district.name;
                // regionController.listRegion.removeLast();
                provinceController.updateRenderList('subdistricts');

                regionController.setActiveIndex(3);
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(
                  currentLetter,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 197, 197, 197),
                  ),
                ),
                title: district.name == regionController.listRegion[2]
                    ? ActiveListTileDistrict(
                        district: district,
                      )
                    : Text(
                        district.name,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
              print(district.name);
              listTiles.clear();
              if (regionController.listRegion.length < 3) {
                regionController.listRegion.add(district.name);
                regionController.listRegion.add('Select Subsistrict 0');
                regionController.setActiveIndex(3);
                provinceController.getSubDistrict(district.id); // Fetch cities
                provinceController.updateRenderList('subdistricts');
              } else {
                regionController.listRegion[2] = district.name;
                provinceController.getSubDistrict(district.id);
                regionController.setActiveIndex(3);
                provinceController.updateRenderList('subdistricts');
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(''),
                title: regionController.listRegion[2] == district.name
                    ? ActiveListTileDistrict(district: district)
                    : Text(
                        district.name,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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

Widget renderSubDistrictList(ProvinceController provinceController,
    SelectionController regionController) {
  if (provinceController.isLoading.value) {
    // Show loading indicator while data is being fetched
    return Center(child: CircularProgressIndicator());
  } else if (provinceController.districts.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    provinceController.subDistricts.sort((a, b) => a.name.compareTo(b.name));
    String? firstLetter;
    List<Widget> listTiles = [];

    for (final subdistrict in provinceController.subDistricts) {
      final currentLetter = subdistrict.name.substring(0, 1);
      if (firstLetter != currentLetter) {
        listTiles.add(
          InkWell(
            onTap: () {
              listTiles.clear();
              if (regionController.listRegion.length < 4) {
                regionController.listRegion[3] = subdistrict.name;

                regionController.listRegion.add('Select SubDistrict koe');

                regionController.setActiveIndex(3);
                provinceController.updateRenderList('subdistricts');

                print(provinceController.districts);
                Get.to(() => AddNewAddresses());
              } else {
                // listTiles.clear();
                regionController.listRegion[3] = subdistrict.name;
                // provinceController.getDistrict(city.cityId); // Fetch cities
                // regionController.listRegion[3] = 'subdistricts';

                // regionController.listRegion.removeLast();
                provinceController.updateRenderList('subdistricts');
                regionController.setActiveIndex(3);
                Get.to(() => AddNewAddresses());
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(
                  currentLetter,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 197, 197, 197),
                  ),
                ),
                title: subdistrict.name == regionController.listRegion[3]
                    ? ActiveListTileSubDistrict(subdistrict: subdistrict)
                    : Text(
                        subdistrict.name,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
              print(subdistrict.name);
              listTiles.clear();
              if (regionController.listRegion.length < 4) {
                regionController.listRegion.add(subdistrict.name);

                regionController
                    .setActiveIndex(regionController.listRegion.length - 1);
                provinceController
                    .getSubDistrict(subdistrict.id); // Fetch cities
                provinceController.updateRenderList('subdistricts');
                Get.to(() => AddNewAddresses());
              } else {
                regionController.listRegion[3] = subdistrict.name;
                // regionController.listRegion[3] = 'Select SubDistrict coek';
                provinceController.updateRenderList('subdistricts');

                regionController.setActiveIndex(3);
                Get.to(() => AddNewAddresses());
              }
            },
            child: Obx(
              () => ListTile(
                leading: Text(''),
                title: subdistrict.name == regionController.listRegion[3]
                    ? ActiveListTileSubDistrict(
                        subdistrict: subdistrict,
                      )
                    : Text(
                        subdistrict.name,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
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
