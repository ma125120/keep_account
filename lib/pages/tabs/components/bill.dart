import 'package:flutter/cupertino.dart';
// import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/date.dart';
import 'package:keep_account/common/enum.dart';
import 'package:keep_account/components/index.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';

class BillForm extends StatefulWidget {
  final Map data;
  final MoneyEnum type;
  final String typeText;

  BillForm({
    this.data,
    this.type = MoneyEnum.outcome,
  }) : this.typeText = MyEnum.moneyComeText[type];

  @override
  _BillFormState createState() => _BillFormState();
}

class _BillFormState extends State<BillForm> {
  Map form = {};
  List iconList = [];

  @override
  initState() {
    super.initState();
    setState(() {
      form = Map.from(widget.data);
      iconList =
          MyEnum.iconList.where((v) => v['type'] == widget.type).toList();
    });
  }

  Column render() {
    return Column(
      children: <Widget>[
        MyInputItem(
          labelText: '金额',
          value: form['price'],
          keyboardType: TextInputType.number,
          onSaved: (val) {
            form['price'] = val;
          },
          validator: (value) {
            if (value.isEmpty) {
              return '请输入金额';
            }
            if (double.parse(value) <= 0) {
              return '金额必须大于0';
            }
            return null;
          },
        ),
        MyFormItem(
          labelText: '日期',
          child: FormField(
            onSaved: (value) {
              form['dateStr'] = value;
            },
            validator: (value) {
              if (value == null || value is String && value.isEmpty) {
                return '日期不能为空';
              }
              return null;
            },
            initialValue: form['dateStr'],
            builder: (FormFieldState field) {
              String value = field.value;
              Color color = (value == null || value.isEmpty)
                  ? MyConst.lowTextColor
                  : MyConst.highTextColor;

              return FlatButton(
                padding: EdgeInsets.only(right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value ?? '',
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: color,
                    ),
                  ],
                ), // Text(form['dateStr'].toString()),
                onPressed: () {
                  MyConst.onTapBlank(context);
                  MyPicker.showDatePicker(
                      context: context,
                      current: value,
                      end: MyDate.getNow(),
                      // magnification: 1,
                      onChange: (date) {
                        field.didChange(MyDate.format('yyyy-MM-dd', date));
                      });
                },
              );
            },
          ),
        ),
        MyPopMenuItem(
          labelText: '${widget.typeText}类型',
          value: form['iconId'],
          onChange: (val) {
            form['iconId'] = val;
          },
          list: iconList,
          map: MyEnum.iconMap,
        ),
        if (widget.type == MoneyEnum.outcome)
          MySwitchItem(
            labelText: '提前${widget.typeText}',
            value: form['hasCost'] == 1,
            onSaved: (val) {
              form['hasCost'] = (val != null && val) ? 1 : 0;
            },
          ),
        MyInputItem(
          isShowBorder: false,
          labelText: '备注',
          value: form['note'],
          keyboardType: TextInputType.text,
          onSaved: (val) {
            form['note'] = val;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return render();
  }
}
