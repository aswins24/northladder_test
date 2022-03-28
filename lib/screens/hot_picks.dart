import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/product_listing.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class HotPicks extends StatelessWidget {
  const HotPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 29, bottom: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hot Picks',
                      children: [
                        TextSpan(
                          text: '(250)',
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
                    'No bids placed',
                    style: Style.h5.textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey),
                  )
                ],
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
        const SizedBox(height: 330,child: ProductListing(products: kHotProductList),)
      ],
    );
  }
}
