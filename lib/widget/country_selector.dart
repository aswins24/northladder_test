import 'package:flutter/material.dart';
import 'package:northladder_test_app/model/country.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class CountrySelector extends StatelessWidget {
  final Country country;
  final bool isSelected;

  const CountrySelector(this.country, this.isSelected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(country.imageAsset),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            country.nameEnglish,
            style: Style.h4.textStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            country.nameArabic,
            style: Style.h4.textStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
      trailing: IgnorePointer(
        child: Radio<bool>(
          value: isSelected,
          groupValue: true,
          onChanged: (value) {},
          activeColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
