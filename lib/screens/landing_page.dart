import 'package:flutter/material.dart';
import 'package:northladder_test_app/screens/registration_screen.dart';
import 'package:northladder_test_app/widget/full_width_button.dart';
import 'package:northladder_test_app/widget/image_container.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'dart:math';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView.useDelegate(
                    diameterRatio: 10,
                    itemExtent: 250,
                    childDelegate: ListWheelChildLoopingListDelegate(
                      children: [
                        Transform.rotate(
                            angle: pi / 2,
                            child: ImageContainer(AppAssets.onBoarding1)),
                        Transform.rotate(
                            angle: pi / 2,
                            child: ImageContainer(AppAssets.onBoarding2))
                      ],
                    )),
              ),
            ),
            Expanded(
              flex: 4,
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView.useDelegate(
                  diameterRatio: 10,
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: [
                      Transform.rotate(
                          angle: pi / 2,
                          child: ImageContainer(AppAssets.onBoarding3)),
                      Transform.rotate(
                          angle: pi / 2,
                          child: ImageContainer(AppAssets.onBoarding4)),
                      Transform.rotate(
                          angle: pi / 2,
                          child: ImageContainer(AppAssets.onBoarding5))
                    ],
                  ),
                  itemExtent: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 8),
              child: Text(
                'Let\'s get started',
                style: Style.h2.textStyle,
              ),
            ),
            Text(
              'Open a free account in minutes right from your phone, and make your money go further.',
              style: Style.p.textStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 2,
            ),
            TextButtonFullWidth(
                text: 'Next',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                }),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
