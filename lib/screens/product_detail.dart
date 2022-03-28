import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:northladder_test_app/model/product.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/constants.dart';

import '../utility/radii.dart';
import '../utility/style/text_style.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  final CarouselController carouselController = CarouselController();
  final List<String> images = const [
    AppAssets.productPreview,
    AppAssets.productPreview,
    AppAssets.productPreview
  ];

  ProductDetail(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int current = 0;
  int value = -1;
  late Size size;
  final TextEditingController _autoBidController = TextEditingController();
  final TextEditingController _customBidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            flexibleSpace: Stack(alignment: Alignment.center, children: [
              CarouselSlider.builder(
                carouselController: widget.carouselController,
                itemCount: widget.images.length,
                itemBuilder: (context, index, ind) => Image.asset(
                  widget.images[index],
                  fit: BoxFit.fill,
                ),
                options: CarouselOptions(
                  height: 300.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: getTagCard(
                    widget.product.tag,
                  )),
              Positioned(
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () =>
                          widget.carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : AppColor.primaryColor)
                              .withOpacity(current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSmallBox,
                      Text(
                        widget.product.name,
                        style: Style.h1.textStyle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      kSmallBox,
                      Text(
                        'TOP BID',
                        style: Style.p.textStyle
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      kSmallBox,
                      Text(
                        widget.product.currentBid.toStringAsFixed(0) + ' AED',
                        style: Style.h1.textStyle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      kMediumBox,
                      Text(
                        'Place bid',
                        style: Style.p.textStyle
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      kMediumBox,
                      //  Radio(value: value, groupValue: groupValue, onChanged: onChanged),
                      RadioListTile<int>(
                        contentPadding: EdgeInsets.zero,
                        value: 0,
                        groupValue: value,
                        activeColor: AppColor.primaryColor,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        },
                        title: Text(
                          (widget.product.currentBid + 50).toStringAsFixed(0) +
                              ' AED',
                          style: Style.p.textStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: value == 0
                                  ? AppColor.primaryColor
                                  : Colors.black),
                        ),
                      ),

                      RadioListTile<int>(
                        contentPadding: EdgeInsets.zero,
                        value: 1,
                        groupValue: value,
                        activeColor: AppColor.primaryColor,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        },
                        title: Row(
                          children:  [
                            Text('Set autobid value',style: Style.p.textStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: value == 1
                                    ? AppColor.primaryColor
                                    : Colors.black)),
                            kSmallWidthBox,
                            const Icon(
                              Icons.info_outline_rounded,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      getTextField(_autoBidController, 'min 200',
                          type: TextInputType.number, isReadOnly: value != 1),
                      RadioListTile<int>(
                        contentPadding: EdgeInsets.zero,
                        value: 2,
                        groupValue: value,
                        activeColor: AppColor.primaryColor,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        },
                        title: Text('Custom',style: Style.p.textStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: value == 2
                                ? AppColor.primaryColor
                                : Colors.black),),
                      ),
                      getTextField(_customBidController, 'min 200',
                          type: TextInputType.number, isReadOnly: value != 2),
                      kSmallBox,
                      Row(
                        children: [
                          Text(
                            'Desired monthly quantity ',
                            style: Style.p.textStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      kSmallBox,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.65, horizontal: 5),
                          decoration: const BoxDecoration(
                              borderRadius: Radii.k8pxRadius,
                              color: AppColor.greyColorContainer),
                          child: Text(
                            '+ Tap to add',
                            style: Style.p.textStyle
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      kMediumBox,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: size.width / 1.02,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: Radii.k8pxRadius,
                            color: AppColor.primaryColor.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              value == 0
                                  ? 'Place Bid ' +
                                      (widget.product.currentBid + 50)
                                          .toStringAsFixed(0) +
                                      ' AED'
                                  : 'Place Bid',
                              style: Style.p.textStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
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

  Widget getTextField(TextEditingController controller, String label,
      {TextInputType? type, bool isReadOnly = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: Radii.k15pxRadius,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration:
                  InputDecoration(border: InputBorder.none, label: Text(label)),
              readOnly: isReadOnly,
              keyboardType: type ?? TextInputType.text,
            ),
          ),
          Text(
            'AED',
            style: Style.p.textStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
