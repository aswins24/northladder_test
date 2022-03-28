import 'package:flutter/material.dart';
import 'package:northladder_test_app/provider/country_change_notifier.dart';
import 'package:northladder_test_app/utility/constants.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:northladder_test_app/widget/country_selector.dart';
import 'package:provider/provider.dart';

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Location',
          style: Style.h2.textStyle
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        kMediumBox,
        Text(
          'Let’s have  a quick setup to customize your experience.\n Choose your location below.',
          style: Style.p.textStyle
              .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        kLargeBox,
        Consumer<CountryChangeNotifier>(
            builder: (context, model, ind) => ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        model.changeSelectedCountry(index);
                      },
                      child: CountrySelector(model.countires[index],
                          model.selectedCountryIndex == index),
                    );
                  },
                  itemCount: model.countires.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ))
      ],
    );
  }
}
