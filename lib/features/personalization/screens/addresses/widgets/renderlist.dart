import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:flutter/material.dart';

Widget renderList(
    List<dynamic> items,
    ProvinceController provinceController,
    SelectionController regionController,
    String placeholder,
    String renderListValue,
    String onTapRenderListValue) {
  if (items.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    items.sort((a, b) => a.city.compareTo(b.city));
    String? firstLetter;
    List<Widget> listTiles = [];

    for (final item in items) {
      final currentLetter = item.city.substring(0, 1);
      if (firstLetter != currentLetter) {
        listTiles.add(
          InkWell(
            onTap: () {
              listTiles.clear();
              regionController.listRegion.add(item.city);
              regionController.listRegion.add(placeholder);
              regionController
                  .setActiveIndex(regionController.listRegion.length - 1);
              provinceController.updateRenderList(onTapRenderListValue);
              print(provinceController.renderList.value);
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
                item.city,
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
              print(item.city);
              listTiles.clear();
              regionController.listRegion.add(item.city);
              regionController.listRegion.add(placeholder);
              regionController
                  .setActiveIndex(regionController.listRegion.length - 1);
              provinceController.updateRenderList(onTapRenderListValue);
              print(provinceController.renderList.value);
            },
            child: ListTile(
              leading: Text(''),
              title: Text(
                item.city,
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
