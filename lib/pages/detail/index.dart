import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/enum.dart';
import 'package:keep_account/common/fn.dart';
import 'package:keep_account/components/const.dart';
import 'package:keep_account/components/index.dart';
import 'package:keep_account/models/bill.dart';
import 'package:keep_account/pages/tabs/components/bill_tab.dart';

class BillDetailPage extends StatefulWidget {
  final Bill info;
  BillDetailPage({this.info});

  static handler() {
    return Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return BillDetailPage(
          info: getParams(context),
        );
      },
    );
  }

  @override
  _BillDetailPageState createState() => _BillDetailPageState();
}

class _BillDetailPageState extends State<BillDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账单详情'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Container(),
          )),
          buildButtons(),
        ],
      ),
    );
  }

  buildButtons() {
    return Container(
      child: Row(
        children: <Widget>[
          Builder(
            builder: (ctx) => Expanded(
              child: RaisedButton(
                onPressed: () {
                  showSheet(
                      context: ctx,
                      child: Container(
                        height: Adapt.px(48 * 2 * 7.5),
                        decoration: BoxDecoration(color: Colors.white),
                        child: BillTab(
                          type: widget.info.type == 0
                              ? MoneyEnum.outcome
                              : MoneyEnum.income,
                          data: widget.info.toJson(),
                        ),
                      ));
                },
                textColor: Colors.white,
                clipBehavior: Clip.antiAlias,
                shape: MyConst.getShapeRadius(100),
                child: Text('编辑'),
              ),
            ),
          ),
          Container(
            width: 16,
          ),
          Expanded(
            child: FlatButton(
              child: Text('删除'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
