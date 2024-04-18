import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldAddress extends StatelessWidget {
  const TextFieldAddress(
      {super.key,
      required this.textController,
      required this.showClearIcon,
      required this.isFocused,
      required this.hintText,
      required this.focuesNode,
      this.readOnly = false,
      this.onTap});

  final TextEditingController textController;
  final RxBool showClearIcon;
  final RxBool isFocused;
  final String hintText;
  final FocusNode focuesNode;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          cursorHeight: 15,
          controller: textController,
          focusNode: focuesNode,
          autofocus: true,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
            hintStyle: TextStyle(color: TColors.darkGrey),
            // contentPadding: EdgeInsets.only(top: 5, bottom: 0),
            // contentPadding: EdgeInsets.zero,

            isDense: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: readOnly
                ? IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right))
                : Obx(
                    () => showClearIcon.value
                        ? IconButton(
                            icon: Icon(Iconsax.close_circle5),
                            onPressed: () {
                              textController.clear();
                            },
                          )
                        : SizedBox(),
                  ),
          ),
          maxLength: 15,
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}