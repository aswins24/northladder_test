import 'package:flutter/cupertino.dart';

class ModelChangeNotifier extends ChangeNotifier{
  List<String> models = const ['Iphone','Samsung','Huawei','Oppo','One Plus'];
  int currentModelIndex = 0;

  void changeCurrentModelIndex(int index){
    currentModelIndex = index;
    notifyListeners();
  }

}