import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';

import 'package:keep_account/models/bill_list.dart';
import 'package:keep_account/pages/tabs/home/list.dart';
import 'package:keep_account/store/index.dart';
import 'package:keep_account/common/index.dart';
import 'package:keep_account/components/index.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';

final counter = Counter();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();

    billStore.getAll();
  }

  @override
  dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  Widget get renderTop {
    return Observer(
        builder: (_) => MyBox(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(24), vertical: Adapt.px(12)),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      MyPicker.showMonthPicker(
                        context: context,
                        isShowHeader: false,
                        onChange: (newMonth) {
                          billStore.setDate(newMonth);
                        },
                        current: billStore.date,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText(
                          billStore.year.toString() + '年',
                          color: Colors.white70,
                        ),
                        Row(
                          children: <Widget>[
                            MyText(
                              billStore.month,
                              color: Colors.white,
                              size: 24,
                            ),
                            MyText(
                              ' 月',
                              color: Colors.white70,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    width: Adapt.px(1),
                    height: 16 * 2.0,
                    decoration: BoxDecoration(color: Colors.white70),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _renderTopItem(
                            '收入', billStore.income.toStringAsFixed(2)),
                        _renderTopItem(
                            '支出', billStore.outcome.toStringAsFixed(2)),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget _renderTopItem(
    String text, [
    String price = '0.00',
  ]) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 4,
          ),
          MyText(
            text,
            color: Colors.white70,
          ),
          Container(
            height: 6,
          ),
          MyText(
            price.toString(),
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('记账'),
        ),
        body: Column(
          children: <Widget>[
            renderTop,
            Observer(
              builder: (_) {
                double total = billStore.total;
                return Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '本月合计：',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 24,
                            color: total > 0 ? MyConst.primary : Colors.green),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Observer(builder: (_) {
                List<BillList> list = billStore.list;
                return EasyRefresh.custom(
                  emptyWidget: list.length == 0 ? buildEmpty() : null,
                  header: MaterialHeader(),
                  onRefresh: () async {
                    await billStore.getAll();
                    return true;
                  },
                  // onLoad: () async {},
                  scrollController: _scrollCtrl,
                  slivers: <Widget>[
                    HomeList(),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/nodata.png',
          width: 120,
        ),
        Text(
          '没有数据',
          style: TextStyle(color: MyConst.lowTextColor),
        ),
      ],
    );
  }
}
