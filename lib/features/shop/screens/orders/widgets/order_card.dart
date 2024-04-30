import 'package:bliguh/common/widgets/buttons/custom_button.dart';
import 'package:bliguh/features/shop/screens/orders/widgets/header_card_order.dart';
import 'package:bliguh/features/shop/screens/orders/widgets/label_image_desc.dart';
import 'package:bliguh/features/shop/screens/orders/widgets/label_shipping_order.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      this.store_name = 'Kacamataku Solusi',
      this.status = 'To Ship',
      this.product_name = 'Kacamata Minus Pria Sporty Fashionable',
      this.variation = 'HITAM LIST GOLD,Lensa Antiradiasi',
      this.order_status = 'To Pay',
      this.order_desc =
          'Penjual telah mengatur pengiriman. Menunggu pesanan di serahkan ke pihak jasa kirim',
      this.order_ship_desc = 'Product will be shipped out by 24-04-2024'});

  final String store_name,
      status,
      product_name,
      variation,
      order_status,
      order_desc,
      order_ship_desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderOrderCard(store_name: store_name, status: status),
          LabelOrderImageDesc(product_name: product_name, variation: variation),
          SizedBox(
            height: TSizes.xs,
          ),
          Divider(),
          SizedBox(
            height: TSizes.xs,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1 Item',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Order Total ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'Rp. 132.000',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.primary, fontWeight: FontWeight.w600)),
              ])),
            ],
          ),
          SizedBox(
            height: TSizes.xs,
          ),
          if (status != 'Cancelled')
            LabelShippingOrder(status: status, order_desc: order_desc),
          SizedBox(
            height: TSizes.xs,
          ),
          Divider(),
          SizedBox(
            height: TSizes.xs,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  getStatusDescription(status, order_ship_desc),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: TColors.darkGrey, fontSize: 13),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 3,
                ),
              ),
              CustomButton(
                height: 45,
                text: getStatus(status),
                fontWeight: FontWeight.w600,
                radius: BorderRadius.all(Radius.circular(6)),
                padding: EdgeInsets.only(
                    right: TSizes.md,
                    left: TSizes.md,
                    top: TSizes.xs,
                    bottom: TSizes.xs),
              )
            ],
          )
        ],
      ),
    );
  }

  String getStatus(String status) {
    switch (status) {
      case 'To Received':
        return 'To Receive';
      case 'Completed':
        return 'Buy Again';
      case 'Coancelled':
        return '';
      default:
        return status;
    }
  }

  String getOrderDesc(String status, order_desc) {
    switch (status) {
      case 'To Received':
        return 'Pesanan telah diserahkan kepada kurir';
      case 'Completed':
        return 'Pesanan telah sampai di terima oleh yang bersangkutan';
      default:
        return order_desc;
    }
  }

  String getStatusDescription(String status, String orderShipDesc) {
    switch (status) {
      case 'To Received':
        return "Confirm receipt after you've checked the received items";
      case 'Completed':
        return "Waiting for seler to give you a rating";
      default:
        return orderShipDesc;
    }
  }
}
