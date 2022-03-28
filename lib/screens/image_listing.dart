import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/radii.dart';

class ImageListing extends StatelessWidget {
  const ImageListing({Key? key}) : super(key: key);
  final List<String> images = const [AppAssets.iPhone7, AppAssets.iPhone8];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => getImageContainer(images[index]),
      itemCount: images.length,
    );
  }

  Widget getImageContainer(String image) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: Radii.k11pxRadius,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        ),
      ),
    );
  }
}
