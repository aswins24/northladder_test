import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/product_detail.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/full_width_button.dart';
import 'package:northladder_test_app/widget/small_text_button.dart';

import '../model/product.dart';

class ProductListing extends StatelessWidget {
  final List<Product> products;

  const ProductListing({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => getProductCard(context, index),
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget getProductCard(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              products[index],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 9, bottom: 19, left: 11, right: 11),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: Radii.k15pxRadius, color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [getTagCard(products[index].tag), Container()],
            ),
            kSmallBox,
            Column(
              children: [
                Image.asset(
                  products[index].image,
                  scale: 3.5,
                ),
                kSmallBox,
                Text(
                  products[index].name,
                  style: Style.p.textStyle
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                kSmallBox,
                SmallTextButton(
                  '+ Place Bid at ${products[index].currentBid + 50} AED',
                  onTap: () {},
                ),
                kSmallBox,
                SmallTextButton(
                  'Qty : ${products[index].quantity}',
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getTagCard(Tag tag) {
    if (tag == Tag.hotBid) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        decoration: const BoxDecoration(
          color: AppColor.hotBidContainerColor,
          borderRadius: Radii.k5pxRadius,
        ),
        child: Text(
          'Hot Bid',
          style: Style.p.textStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColor.hotBidTextColor),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        decoration: const BoxDecoration(
            color: AppColor.freshBidContainerColor,
            borderRadius: Radii.k5pxRadius),
        child: Text(
          'Fresh bid',
          style: Style.p.textStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColor.freshBidTextColor),
        ),
      );
    }
  }
}
