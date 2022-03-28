import 'package:flutter/cupertino.dart';
import 'package:northladder_test_app/model/country.dart';
import 'package:northladder_test_app/utility/app_assets.dart';

class CountryChangeNotifier extends ChangeNotifier {
  List<Country> countires = [
    Country(nameEnglish: 'United Arab Emirates',
        nameArabic: 'الإمارات العربية المتحدة',
        imageAsset: AppAssets.uae),
    Country(nameEnglish: 'Oman',
        nameArabic: 'سلطنة عمان',
        imageAsset: AppAssets.oman),
    Country(nameEnglish: 'Kuwait',
        nameArabic: 'الكويت',
        imageAsset: AppAssets.kuwait),
  ];
  int selectedCountryIndex = 0;

  changeSelectedCountry(int index){
    selectedCountryIndex = index;
    notifyListeners();
  }
}