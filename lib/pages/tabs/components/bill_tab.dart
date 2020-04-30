import 'package:flutter/cupertino.dart';
import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/date.dart';
import 'package:keep_account/common/enum.dart';
// import 'package:keep_account/models/index.dart';
import 'package:keep_account/components/index.dart';
import 'package:keep_account/data/bill.dart';
import 'package:keep_account/store/index.dart';
import './bill.dart';

class BillTab extends StatefulWidget {
  final MoneyEnum type;

  BillTab({
    this.type = MoneyEnum.outcome,
  });

  @override
  _BillTabState createState() => _BillTabState();
}

final defaultForm = {
  'price': 10,
  'dateStr': MyDate.format('yyyy-MM-dd'),
  'iconId': '1',
  'note': 'dsa',
  'hasCost': 1,
};

class _BillTabState extends State<BillTab> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

  Map<String, dynamic> form = {};

  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    setState(() {
      form = Map.from(defaultForm);
    });
  }

  Widget renderForm() {
    return Form(
      key: _formKey,
      child: BillForm(
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

                await billProvider.insert(form);
                MyStore.billStore.getAll();
                Navigator.of(context).pop();
                print('保存成功');
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
              print(form);
            },
          ),
        ),
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
      padding: EdgeInsets.symmetric(
          horizontal: Adapt.px(36), vertical: Adapt.px(12)),
      child: SingleChildScrollView(
        child: renderBody(),
      ),
    );
  }
}
