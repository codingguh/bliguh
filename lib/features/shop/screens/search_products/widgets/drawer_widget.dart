import 'package:bliguh/features/shop/screens/search_products/widgets/filter_by_rating.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final DrawerController drawerController = Get.put(DrawerController());
    return Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: TColors.primary,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Filter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: TSizes.md, right: TSizes.md, bottom: TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterByRating(),
                  Divider(),
                  FilterByRating(),
                  Divider(),
                  FilterByRating(),
                  Divider(),
                  FilterByRating(),
                ],
              ),
            ),
          ],
        ));
  }
}
