import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/bid_by_series.dart';
import 'package:northladder_test_app/screens/category_listing.dart';
import 'package:northladder_test_app/screens/first_to_bid.dart';
import 'package:northladder_test_app/screens/hot_picks.dart';
import 'package:northladder_test_app/screens/trending_in_market.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/widget/small_text_button.dart';

import '../utility/app_assets.dart';
import '../utility/style/text_style.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.menu,
                    scale: 2.5,
                  ),
                  kSmallWidthBox,
                  Text(
                    'Bid',
                    style: Style.h2.textStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  SmallTextButton('My Bids', onTap: () {}),
                  kMediumWidthBox,
                  Image.asset(AppAssets.solidBell, scale: 2.5,),
                  kMediumWidthBox,
                  Container(
                    padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(color: AppColor.primaryColor, shape: BoxShape.circle),
                      child: const Icon(Icons.search, size: 18,),)
                ],
              ),
              kMediumBox,
              Text('Interested in', style: Style.h4.textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15),),
              kMediumBox,
              const SizedBox(
                  height: 30,
                  child:  CategoryList(),),
              HotPicks(),
              BidBySeries(),
              TrendingInMarket(),
              FirstToBid(),

            ],
          ),
        ),
      ),
    );
  }
}
