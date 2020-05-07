import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/date.dart';
import 'package:keep_account/common/enum.dart';
import 'package:keep_account/common/index.dart';
// import 'package:keep_account/models/index.dart';
import 'package:keep_account/components/index.dart';
import 'package:keep_account/data/bill.dart';
import 'package:keep_account/models/bill.dart';
import 'package:keep_account/store/index.dart';
import './bill.dart';

class BillTab extends StatefulWidget {
  final MoneyEnum type;
  final Map data;

  BillTab({
    this.type = MoneyEnum.outcome,
    this.data,
  });

  @override
  _BillTabState createState() => _BillTabState();
}

final defaultForm = {
  'price': 0,
  'dateStr': MyDate.format('yyyy-MM-dd'),
  'iconId': '1',
  'note': '',
  'hasCost': 0,
};

class _BillTabState extends State<BillTab> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

  Map<String, dynamic> form = {};

  final _formKey = GlobalKey<FormState>();
  final _childKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    setState(() {
      form = {
        ...(widget.data ?? defaultForm),
        'iconId': (widget.type == MoneyEnum.income
                ? MyEnum.incomeList
                : MyEnum.outcomeList)
            .first['id']
      };
    });
  }

  Widget renderForm() {
    return Form(
      key: _formKey,
      child: BillForm(
        key: _childKey,
        data: form,
        type: widget.type,
      ),
    );
  }

  Widget renderBody() {
    Color primary = Theme.of(context).primaryColor;

    return Column(
      children: <Widget>[
        renderForm(),
        // Expanded(
        //   child: Container(),
        // ),
        Container(
          margin: EdgeInsets.only(top: Adapt.px(16)),
          width: double.infinity,
          child: RaisedButton(
            // color: primary,
            textColor: Colors.white,
            clipBehavior: Clip.antiAlias,
            shape: MyConst.getShapeRadius(100),
            child: Text('确认'),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                form['type'] = MyEnum.moneyComeInt[widget.type];
                form['price'] = double.parse(form['price']);

                if (form['id'] != null) {
                  await billProvider.update(Bill.fromJson(form));
                } else {
                  await billProvider.insert(form);
                }

                billStore.getAll();
                Navigator.of(context).pop();
                BotToast.showSimpleNotification(title: '保存成功');
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Adapt.px(16)),
          width: double.infinity,
          child: OutlineButton(
            textColor: primary,
            borderSide: BorderSide(color: primary, width: 1),
            clipBehavior: Clip.antiAlias,
            shape: MyConst.getShapeRadius(100),
            highlightElevation: 0,
            child: Text('重置'),
            onPressed: () {
              _formKey.currentState.reset();
            },
          ),
        ),
        // Container(
        //   height: 32,
        // ),
        CloseButton(),
      ],
    );
  }

  onTapBlank() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: EdgeInsets.only(
          top: Adapt.px(12),
          bottom: Adapt.px(12) + MediaQuery.of(context).viewInsets.bottom,
          left: Adapt.px(36),
          right: Adapt.px(36)),
      child: SingleChildScrollView(
        child: renderBody(),
      ),
    );
  }
}
