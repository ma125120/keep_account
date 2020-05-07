// import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/components/index.dart';

class MyInputItem extends StatelessWidget {
  final String labelText;
  final double labelWidth;
  final dynamic value;
  final ValueChanged<String> onChange;
  final ValueChanged<String> onSaved;
  final TextInputType keyboardType;
  final ValidateCallback validator;
  final bool isShowBorder;
  final int maxLength;

  MyInputItem({
    @required this.labelText,
    this.labelWidth,
    this.value,
    this.isShowBorder = true,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.onChange,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return MyFormItem(
      isShowBorder: isShowBorder,
      labelText: '$labelText',
      labelWidth: labelWidth,
      // height: 36.0,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          onSaved: onSaved,
          onChanged: onChange,
          keyboardType: keyboardType,
          maxLength: maxLength,
          initialValue: value != null ? value.toString() : '',
          textAlign: TextAlign.right,
          decoration: const InputDecoration().copyWith(
              hintText: '请输入$labelText',
              counterText: "",
              contentPadding: EdgeInsets.only(right: 0)),
          validator: validator ??
              (value) {
                // if (value.isEmpty) {
                //   return '请输入$labelText';
                // }
                // if (double.parse(value) <= 0) {
                //   return '$labelText必须大于0';
                // }
                return null;
              },
        ),
      ),
    );
  }
}
