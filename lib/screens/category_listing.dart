import 'package:flutter/material.dart';
import 'package:northladder_test_app/provider/category_change_notifier.dart';
import 'package:northladder_test_app/utility/app_color.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryChangeNotifier>(builder: (context, model, _) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {

        return InkWell(
          onTap: (){
            model.changeCurrentIndex(index);
          },
            child: categoryTile(model.categories[index], model.currentIndex == index));
      },itemCount: model.categories.length,);
    });
  }

  Widget categoryTile(String category, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          borderRadius: Radii.k8pxRadius),
      child: Text(category, style: Style.h4.textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,color: isSelected ? Colors.white:Colors.black),),
    );
  }
}
