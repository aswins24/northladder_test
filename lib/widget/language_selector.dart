import 'package:flutter/material.dart';
import 'package:northladder_test_app/model/language.dart';

class LanguageItem extends StatelessWidget {
  final Language language;

  const LanguageItem(this.language, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(language.imageAsset), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        Text(language.name),
      ],
    );
  }
}
