import 'package:flutter/cupertino.dart';
import 'package:northladder_test_app/utility/app_assets.dart';

import '../model/device.dart';

class DeviceChangeNotifier extends ChangeNotifier {
  List<Device> devices = const [
    Device(
      'Smartphone',
      AppAssets.phone,
    ),
    Device('Laptop', AppAssets.laptop),
    Device('Smartwatch', AppAssets.smartwatch),
    Device('Tablet', AppAssets.tablet)
  ];
  List<int> selectedDevices =[];

  void addOrRemoveDevice(int index){
    if(selectedDevices.contains(index)){
      selectedDevices.remove(index);
    }else{
      selectedDevices.add(index);
    }
    notifyListeners();
  }
}
