import 'package:flutter/material.dart';
import 'package:keep_account/common/index.dart';
import 'package:keep_account/components/const.dart';

class MyFormItem extends StatelessWidget {
  final String labelText;
  final double labelWidth;
  final Widget child;
  final Alignment alignment;
  final bool isShowBorder;
  final double height;
  final double right;

  MyFormItem({
    @required this.labelText,
    this.labelWidth,
    this.alignment,

    /// input 默认是48
    height,
    this.right = 0,
    this.isShowBorder = true,
    this.child,
  }) : this.height = Adapt.px(48 * 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: isShowBorder ? 1 : 0, color: MyConst.divideColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: labelWidth ?? null,
            child: Text(
              labelText,
              style: TextStyle(color: MyConst.mediumTextColor),
            ),
          ),
          Container(
            width: Adapt.px(8),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: right ?? 0),
              alignment: alignment ?? AlignmentDirectional.centerEnd,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
