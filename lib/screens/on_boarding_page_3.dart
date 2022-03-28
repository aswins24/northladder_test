import 'package:flutter/material.dart';
import 'package:northladder_test_app/provider/device_change_notifier.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/device_selector.dart';
import 'package:provider/provider.dart';

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'What are you interested in buying?',
          style: Style.h2.textStyle.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        kSmallBox,
        Text(
          'This helps up customize your experience',
          style: Style.p.textStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        kLargeBox,
        kLargeBox,
        Text(
          'Choose one or more device categories',
          style: Style.h4.textStyle
              .copyWith(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        kSmallBox,
        Consumer<DeviceChangeNotifier>(
          builder: (context, model, _) => GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  model.addOrRemoveDevice(index);
                },
                  child: DeviceSelector(model.devices[index], model.selectedDevices.contains(index)));
            },
            itemCount: model.devices.length,
          ),
        )
      ],
    );
  }
}
