import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

import '../utility/app_color.dart';

class TextButtonFullWidth extends StatelessWidget {
  late Size size;
  final String text;
  final VoidCallback onTap;

  TextButtonFullWidth({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 1.05,
        padding: const EdgeInsets.only(top: 12.5, bottom: 14.5),
        decoration: const BoxDecoration(
            borderRadius: Radii.k11pxRadius, color: AppColor.primaryColor),
        child: Text(
          text,
          style: Style.h4.textStyle
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
