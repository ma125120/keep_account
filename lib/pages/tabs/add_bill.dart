import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/enum.dart';
import 'package:keep_account/components/index.dart';
import './components/bill_tab.dart';

class AddBill extends StatefulWidget {
  static handler() {
    return Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return AddBill();
      },
    );
  }

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> with SingleTickerProviderStateMixin {
  // static int index = 0;

  PageController _pageController;
  TabController _tabCtrl;

  final pages = [
    BillTab(),
    BillTab(
      type: MoneyEnum.income,
    ),
  ];

  @override
  initState() {
    super.initState();
    _pageController = PageController();
    _tabCtrl = TabController(length: pages.length, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          MyConst.onTapBlank(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTabBar(),
            buildPageView(),
          ],
        ),
      ),
    );

    return body;
  }

  TabBar buildTabBar() {
    return TabBar(
      indicatorWeight: Adapt.px(8),
      indicatorColor: MyConst.primary,
      indicatorPadding: EdgeInsets.symmetric(horizontal: Adapt.px(80)),
      tabs: [
        Tab(
          text: '支出',
        ),
        Tab(
          text: '收入',
        ),
      ],
      controller: _tabCtrl,
    );
  }

  Widget buildPageView() {
    return Container(
      height: Adapt.px(48 * 2 * 7.5),
      child: TabBarView(
        children: pages,
        controller: _tabCtrl,
      ),
    );
  }
}
