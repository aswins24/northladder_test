import 'package:flutter/material.dart';
import 'package:northladder_test_app/model/language.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/language_selector.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({Key? key}) : super(key: key);
  final List<Language> languages = const [Language('English', AppAssets.usa)];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Choose Preferred Language',
          style: Style.h2.textStyle
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        kMediumBox,
        kSmallBox,
        Text(
          'Northladder’s content is available in several languages. Select your preferred language below.',
          style: Style.p.textStyle.copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        kLargeBox,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: Radii.k15pxRadius,
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<Language>(
            items: languages
                .map((e) => DropdownMenuItem<Language>(child: LanguageItem(e)))
                .toList(),
            onChanged: (value) {},
          )),
        )
      ],
    );
  }
}
