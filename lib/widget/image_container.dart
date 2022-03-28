import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/radii.dart';

class ImageContainer extends StatelessWidget {
  final String imageAsset;


  ImageContainer(this.imageAsset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(right: 10, top: 20),
      decoration: BoxDecoration(
        borderRadius: Radii.k15pxRadius,
        image:
            DecorationImage(image: AssetImage(imageAsset), fit: BoxFit.cover),
      ),
    );
  }
}
