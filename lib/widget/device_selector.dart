import 'package:flutter/material.dart';
import 'package:northladder_test_app/model/device.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class DeviceSelector extends StatelessWidget {
  final Device device;
  final bool isSelected;

  const DeviceSelector(this.device,this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(device.assetImage), fit: BoxFit.fill),
              ),
            ),
            Text(
              device.name,
              style: Style.p.textStyle.copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
        Positioned(
          top: 5,
          right: 40,
          child: isSelected ?Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor, shape: BoxShape.circle),
          ): Container(),
        )
      ],
    );
  }
}
