import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/image_listing.dart';
import 'package:northladder_test_app/screens/model_listing.dart';

import '../utility/app_color.dart';
import '../utility/style/text_style.dart';

class BidBySeries extends StatelessWidget {
  const BidBySeries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Bid by series',
                  children: [
                    TextSpan(
                      text: '(25)',
                      style: Style.h4.textStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor),
                    )
                  ],
                  style: Style.h4.textStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Text(
                'See All',
                style: Style.h5.textStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor),
              )
            ],
          ),
        ),
        const SizedBox(height: 30,child: ModelListing(),),
        const SizedBox(height: 180,child: ImageListing(),)

      ],
    );
  }
}
