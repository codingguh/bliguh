import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldAddress extends StatefulWidget {
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
  State<TextFieldAddress> createState() => _TextFieldAddressState();
}

class _TextFieldAddressState extends State<TextFieldAddress> {
  @override
  void dispose() {
    widget.focuesNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          cursorHeight: 15,
          controller: widget.textController,
          focusNode: widget.focuesNode,
          autofocus: true,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.hintText,
            counterText: '',
            hintStyle: TextStyle(color: TColors.darkGrey),
            // contentPadding: EdgeInsets.only(top: 5, bottom: 0),
            // contentPadding: EdgeInsets.zero,

            isDense: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: widget.readOnly
                ? IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right))
                : Obx(
                    () => widget.showClearIcon.value
                        ? IconButton(
                            icon: Icon(Iconsax.close_circle5),
                            onPressed: () {
                              widget.textController.clear();
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
