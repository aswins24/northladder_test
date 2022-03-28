import 'package:flutter/cupertino.dart';
import 'package:northladder_test_app/model/product.dart';
import 'package:northladder_test_app/utility/app_assets.dart';

const kSmallBox = SizedBox(
  height: 15,
);
const kMediumBox = SizedBox(
  height: 20,
);

const kLargeBox = SizedBox(
  height: 38,
);
const kSmallWidthBox = SizedBox(
  width: 10,
);
const kMediumWidthBox = SizedBox(
  width: 20,
);
const kHotProductList = [
  Product('iPhone 11 Pro, 16GB', Tag.hotBid, 3000, AppAssets.product, 5),
  Product('iPhone 11 Pro, 16GB', Tag.hotBid, 3000, AppAssets.product, 5),
  Product('iPhone 11 Pro, 16GB', Tag.hotBid, 3000, AppAssets.product, 5),
];

const List<Product> kFreshProductList = [
  Product('iPhone 11 Pro, 16GB', Tag.freshBid, 3000, AppAssets.product, 5),
  Product('iPhone 11 Pro, 16GB', Tag.freshBid, 3000, AppAssets.product, 5),
  Product('iPhone 11 Pro, 16GB', Tag.freshBid, 3000, AppAssets.product, 5),
];
