import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:bliguh/features/shop/screens/payment/widgets/payment_list_card.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: TAppBar(
        showBackArrow: true,
        showBackground: true,
        bgColor: Colors.white,
        onTap: () {
          Get.back();
        },
        isCenter: true,
        title: Text(
          'Payment Method',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ListPayment(
          isIcon: true,
          icon: Iconsax.wallet,
          title: 'Guhpay',
        ),
        ListPayment(
          isIcon: true,
          icon: Iconsax.receipt_edit,
          title: 'COD',
          isChecked: true,
          showMore: true,
          isOpen: true,
        ),
        ListPayment(
          isIcon: true,
          icon: Iconsax.bank,
          title: 'Bank Transfer',
        ),
        ListPayment(
          image: TImages.paypal,
          title: 'Paypal',
        ),
        ListPayment(
          image: TImages.indomaret,
          title: 'Alfamaret',
        ),
        ListPayment(
          image: TImages.alfamaret,
          title: 'Indomaret',
        ),
      ])),
      bottomNavigationBar: ButtonBottomNavigationbar(
        showDescription: true,
        description: Text('Handling fee Rp 1.000'),
      ),
    );
  }
}

class ListPayment extends StatelessWidget {
  const ListPayment(
      {super.key,
      this.image = TImages.acerlogo,
      required this.title,
      this.isChecked = false,
      this.isIcon = false,
      this.showMore = false,
      this.isOpen = false,
      this.icon = Icons.check});

  final String image, title;
  final bool isChecked, isIcon, showMore, isOpen;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: TSizes.sm, top: 9, bottom: 9, right: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                color: const Color.fromARGB(255, 233, 233, 233), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentListCard(
              isIcon: isIcon,
              icon: icon,
              image: image,
              title: title,
              isChecked: isChecked,
              showMore: showMore),
          if (showMore)
            Container(
                margin: isOpen
                    ? EdgeInsets.only(top: 6, left: 24)
                    : EdgeInsets.zero,
                child: isOpen
                    ? Column(
                        children: [
                          PaymentListCard(
                              isIcon: false,
                              icon: icon,
                              image: TImages.mandiri,
                              title: 'Mandiri',
                              isChecked: true,
                              isChild: true,
                              showMore: false),
                          PaymentListCard(
                              isIcon: false,
                              icon: icon,
                              image: TImages.bri,
                              title: 'BRI',
                              showMore: false)
                        ],
                      )
                    : SizedBox()),
        ],
      ),
    );
  }
}
