import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class SmallTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SmallTextButton(this.text, {Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
        decoration: const BoxDecoration(color: AppColor.primaryColor, borderRadius: Radii.k5pxRadius),
        child: Text(
          text,
          style: Style.h4.textStyle
              .copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
