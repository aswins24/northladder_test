import 'package:flutter/material.dart';
import 'package:northladder_test_app/provider/model_change_notifier.dart';
import 'package:provider/provider.dart';

import '../utility/app_color.dart';
import '../utility/radii.dart';
import '../utility/style/text_style.dart';

class ModelListing extends StatelessWidget {
  const ModelListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelChangeNotifier>(builder: (context, model, _) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {

          return InkWell(
              onTap: (){
                model.changeCurrentModelIndex(index);
              },
              child: modelTile(model.models[index], model.currentModelIndex == index));
        },itemCount: model.models.length,);
    });
  }

  Widget modelTile(String category, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          borderRadius: Radii.k8pxRadius),
      child: Text(category, style: Style.h4.textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,color: isSelected ? Colors.white:Colors.black),),
    );
  }
}
