import 'package:flutter/cupertino.dart';
// import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/components/index.dart';

class MySwitchItem extends StatelessWidget {
  final String labelText;
  final double labelWidth;
  final bool value;
  final ValueChanged<bool> onChange;
  final ValueChanged<bool> onSaved;
  final List list;
  final String idName;
  final String labelName;
  final String iconName;
  final Map map;
  final bool isShowBorder;
  final ValidateCallback validator;

  MySwitchItem({
    @required this.labelText,
    this.labelWidth,
    this.value,
    this.map = const {},
    this.list = const [],
    this.isShowBorder = true,
    this.idName = 'id',
    this.labelName = 'name',
    this.iconName = 'icon',
    this.onSaved,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return MyFormItem(
      isShowBorder: isShowBorder,
      labelText: labelText,
      right: 0,
      child: FormField(
        builder: (FormFieldState field) {
          return renderField(primary, field);
        },
        onSaved: onSaved,
        validator: validator,
        initialValue: value,
      ),
    );
  }

  CupertinoSwitch renderField(Color primary, FormFieldState field) {
    bool value = field.value;

    return CupertinoSwitch(
        value: value ?? false,
        activeColor: primary,
        onChanged: (val) {
          field.didChange(val);
        });
  }
}
