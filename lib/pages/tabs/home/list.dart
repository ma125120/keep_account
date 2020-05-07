import 'package:flutter/material.dart';
import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/common/enum.dart';
import 'package:keep_account/components/const.dart';
import 'package:keep_account/components/index.dart';
import 'package:keep_account/data/bill.dart';
import 'package:keep_account/models/bill.dart';
import 'package:keep_account/models/bill_list.dart';
import 'package:keep_account/pages/tabs/components/bill_tab.dart';
import 'package:keep_account/store/bill.dart';
import 'package:keep_account/store/index.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  buildList() {
    return Observer(
      builder: (_) {
        List<BillList> list = billStore.list;

        return SliverList(
          delegate: SliverChildBuilderDelegate((ctx, idx) {
            BillList item = list[idx];

            return renderCard(item);
          }, childCount: list?.length),
        );
      },
    );
  }

  // 每一天的卡片
  renderCard(BillList item) {
    Widget row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(item.dateStr),
        Text(
          item.total.toStringAsFixed(2).toString(),
          style: TextStyle(
              fontSize: 28,
              color: item.total > 0 ? MyConst.primary : Colors.green),
        ),
      ],
    );
    double gap = 8;

    return Container(
      margin: EdgeInsets.only(
        top: gap * 2,
        left: gap,
        right: gap,
      ),
      padding: EdgeInsets.all(gap),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, 0),
                blurRadius: 1,
                color: Color(0x22000000))
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Builder(
        builder: (ctx) => ExpansionTile(
          initiallyExpanded: true,
          title: row,
          children: renderCardItem(item.children, ctx),
        ),
      ),
    );
  }

  // 每一天的列表记录
  renderCardItem(List<Bill> list, BuildContext ctx) {
    Map iconMap = MyEnum.iconMap;
    return list
        .map((v) => MyInk(
              onTap: () {
                showSheet(
                  context: ctx,
                  child: SafeArea(
                      child: Container(
                    height: Adapt.px(48 * 2 * 7.5),
                    child: BillTab(
                      type: v.type == 0 ? MoneyEnum.outcome : MoneyEnum.income,
                      data: v.toJson(),
                    ),
                  )),
                );
              },
              onLongPress: () {
                showConfirm(
                    context: ctx,
                    onOk: () async {
                      await billProvider.delete(v.id);
                      await billStore.getAll();
                      return true;
                    });
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 16, left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Iconfont(iconMap[v.iconId]['icon'],
                        size: 20, color: MyConst.mediumTextColor),
                    Container(
                      width: 4,
                    ),
                    Text(
                      iconMap[v.iconId]['name'],
                      style: TextStyle(color: MyConst.mediumTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 4),
                        child: (v.note != null && v.note.isNotEmpty)
                            ? Text(
                                '(备注：${v.note})',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: MyConst.lowTextColor),
                              )
                            : null,
                      ),
                    ),
                    Text(
                      v.priceStr,
                      style: TextStyle(
                          fontWeight: v.type == 0 ? null : FontWeight.bold,
                          fontSize: 20,
                          color: v.type == 0 ? Colors.green : MyConst.primary),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
