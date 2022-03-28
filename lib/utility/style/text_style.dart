import 'dart:ui';

import 'package:flutter/cupertino.dart';

enum Style{h1, h2,h3,h4,h5,p,pBold,pSmall}

extension TextStyles on Style {
  TextStyle get textStyle => TextStyle(
    fontFamily: fontFamily,
    fontSize: size,
    fontWeight: fontWeight,


  );


}

extension FontFamily on Style{
  String get fontFamily => 'Worksans';
}

extension FontWeights on Style {
  FontWeight get fontWeight {
    switch (this) {
      case Style.h1:
        return FontWeight.w700;
      case Style.h2:
        return FontWeight.w500;
      case Style.h3:
        return FontWeight.w700;
      case Style.h4:
        return FontWeight.w500;
      case Style.h5:
        return FontWeight.normal;
      case Style.p:
        return FontWeight.normal;
      case Style.pBold:
        return FontWeight.w700;
      case Style.pSmall:

      return FontWeight.normal;
    }
  }
}

extension TextSize on Style{
  double get size {
    switch(this){
      case Style.h1:
        return 24;
      case Style.h2:
        return 22;
      case Style.h3:
        return 20;
      case Style.h4:
        return 18;
      case Style.h5:
        return 15;
      case Style.p:
        return 14;
      case Style.pBold:
        return 14;
      case Style.pSmall:

        return 12;
    }
  }
}