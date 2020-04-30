import 'package:flutter/material.dart';
import 'package:keep_account/common/adapt.dart';

const _cir = Radius.circular(12);

class MyConst {
  static const dbPath = 'record_money';
  static const sheetBorderRadius = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: _cir,
    topRight: _cir,
  ));

  static const rradius =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(_cir));

  static ShapeBorder getShapeRadius(double px) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Adapt.px(px))));
  }

  static const primary = Color(0xFF7964E3);
  static const highTextColor = Color(0xDD000000);
  static const mediumTextColor = Color(0x99000000);
  static const lowTextColor = Color(0x60000000);
  static const grey = Color(0x61000000);
  static const divideColor = Color(0xFFF0F0F0);

  static final fontSize = Adapt.px(28);

  static onTapBlank(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

typedef ValidateCallback = String Function(dynamic);
