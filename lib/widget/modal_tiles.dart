import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class ModalTiles extends StatelessWidget {
  final String name;
  final String assetName;

  const ModalTiles(this.name, this.assetName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        assetName,
        scale: 2.5,
      ),
      title: Text(
        name,
        style: Style.h4.textStyle
            .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
