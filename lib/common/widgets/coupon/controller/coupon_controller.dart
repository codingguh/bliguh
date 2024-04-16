import 'package:ecommerce_firebase_getx/common/widgets/coupon/model/coupon_model.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  void claimCoupon(CouponModel coupon) {
    if (!coupon.isClaimed.value) {
      coupon.isClaimed.value = true;
    }
  }

  void useCoupon(CouponModel coupon) {
    if (!coupon.isUsed.value && coupon.isClaimed.value) {
      coupon.isUsed.value = true;
    }
  }
}

class GroupCouponController extends GetxController {
  // Initialize coupons list with provided data
  RxList<CouponModel> couponsx = <CouponModel>[
    CouponModel(
      id: 1,
      color: TColors.third,
      title: 'Free Shipping',
      description: 'Min Spend 10 RB',
      isClaimed: true.obs, // Convert to RxBool
      isUsed: false.obs, // Convert to RxBool
    ),
    CouponModel(
      id: 2,
      color: TColors.third,
      title: 'Free Shipping',
      description: 'Min Spend 20 RB',
      isClaimed: true.obs, // Convert to RxBool
      isUsed: false.obs, // Convert to RxBool
    ),
  ].obs;

  RxList<CouponModel> couponDisc = <CouponModel>[
    CouponModel(
      id: 1,
      color: TColors.primary,
      title: '5% Off Cappet at Rp 100RB',
      description: 'Min Spend 10 RB',
      isClaimed: true.obs, // Convert to RxBool
      isUsed: false.obs, // Convert to RxBool
    ),
    CouponModel(
      id: 2,
      color: TColors.primary,
      title: '10% Off Cappet at Rp 20RB',
      description: 'Min Spend 20 RB',
      isClaimed: true.obs, // Convert to RxBool
      isUsed: false.obs, // Convert to RxBool
    ),
    CouponModel(
      id: 3,
      color: TColors.primary,
      title: '15% Off Cappet at Rp 30RB',
      description: 'Min Spend 30 RB',
      isClaimed: true.obs, // Convert to RxBool
      isUsed: false.obs, // Convert to RxBool
    ),
  ].obs;

  GroupCouponController();

  void selectCoupon(List<CouponModel> coupons, CouponModel selectedCoupon) {
    for (var coupon in coupons) {
      coupon.isUsed.value = coupon == selectedCoupon;
    }
  }

  void claimCoupon(List<CouponModel> coupons, CouponModel selectedCoupon) {
    for (var coupon in coupons) {
      coupon.isUsed.value = coupon == selectedCoupon;
      print(coupon.isUsed.value);
      print(selectedCoupon);
    }
    refresh();
  }
}
