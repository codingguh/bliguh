import 'package:bliguh/features/shop/screens/checkout/widgets/show_body_items.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LabeShopVoucher extends StatelessWidget {
  const LabeShopVoucher(
      {super.key,
      required this.title,
      this.showRightContent = false,
      required this.iconTitle,
      this.rightContentWidget,
      this.widthRightContent = 70,
      this.showBody = false,
      this.onTap});

  final String title;
  final Widget iconTitle;
  final bool showRightContent, showBody;
  final Widget? rightContentWidget;
  final double widthRightContent;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: TColors.lightGrey),
        ),
      ),
      padding:
          EdgeInsets.only(left: TSizes.md, top: TSizes.md, bottom: TSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    iconTitle,
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                    ),
                  ],
                ),
                showRightContent
                    ? Row(
                        children: [
                          LabelRightContent(
                            widget: rightContentWidget,
                            widthRight: widthRightContent,
                          ),
                          Icon(
                            Icons.chevron_right,
                          )
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
          if (showBody)
            Column(
              children: [
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ShowBodyItem(
                  title: 'Merchendasie Subtotal',
                  price: 'Rp.127.000',
                ),
                ShowBodyItem(
                  title: 'Shipping Subtotal',
                  price: 'Rp.144.000',
                ),
                ShowBodyItem(
                  title: 'Shipping Discount Subtotal',
                  price: '-Rp.20.000',
                ),
                ShowBodyItem(
                  title: 'Voucher Discount',
                  price: '-Rp12.340',
                ),
                ShowBodyItem(
                  title: 'Buyer Service Fee',
                  price: 'Rp1.000',
                ),
                ShowBodyItem(
                  title: 'Handling Fee',
                  price: 'Rp1.000',
                ),
                ShowBodyItem(
                  title: 'Total Payment',
                  price: 'Rp240.660',
                  isTotal: true,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class LabelRightContent extends StatelessWidget {
  const LabelRightContent({super.key, this.widget, this.widthRight = 170});

  final Widget? widget;
  final double widthRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: widget,
    );
  }
}
