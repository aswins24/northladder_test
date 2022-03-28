import 'package:flutter/cupertino.dart';

class CategoryChangeNotifier extends ChangeNotifier{
  List<String> categories = const ['All', 'Iphone', 'Laptop','Tablet','Smartwatch'];
  int currentIndex =0;

  void changeCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
}