import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:keep_account/components/index.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddBill extends StatefulWidget {
  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  Map form = {
    'date': '',
    'dateInt': '',
  };

  Widget get datePicker => CupertinoDatePicker(
    onDateTimeChanged: (date) {
      print(date);
    },
    mode: CupertinoDatePickerMode.date,
  );

  DateTime _date =  DateTime.now();
  Future<void> _selectDate() async {
    MyPicker.showMonthPicker(context: context,);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(child: Text('鱼粉选择'), onPressed: () { _selectDate(); },),
      // datePicker,
      // MyDatePicker(
      //   child: Text('显示date picker'),
      //   date: new DateTime.now(),
      // ),
      RaisedButton(
        child: Text('显示date picker'),
        onPressed: () {
          DatePicker.showDatePicker(context,
            showTitleActions: true,
            // minTime: DateTime(2018, 3, 5),
            // maxTime: DateTime(2019, 6, 7), 
            onChanged: (date) {
              print('change $date');
            },
            onConfirm: (date) {
              print('confirm $date');
            },
            currentTime: DateTime.now(), 
            locale: LocaleType.zh
          );
          // print(new DateTime.now().runtimeType == DateTime);
          // showCupertinoModalPopup(context: context, builder: (_) => datePicker);
        },
      ),
      CloseButton(),
    ],);
  }
}