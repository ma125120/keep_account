// import 'package:flutter/material.dart';

Map list2map(List list, [String iconName = 'icon', String idName = 'id']) {
  Map map = {};
  list.forEach((v) {
    map[v['id']] = v;
  });
  return map;
}

enum MoneyEnum {
  income,
  outcome,
}

class MyEnum {
  static Map moneyComeText = {
    MoneyEnum.income: '收入',
    MoneyEnum.outcome: '支出',
  };
  static Map moneyComeInt = {
    MoneyEnum.outcome: 0,
    MoneyEnum.income: 1,
  };

  static List outcomeList = [
    {'id': '1', 'icon': 0xe612, 'type': MoneyEnum.outcome, 'name': '食品'}, // 食品
    {'id': '2', 'icon': 0xe62b, 'type': MoneyEnum.outcome, 'name': '交通'}, // 交通
    {'id': '3', 'icon': 0xe69c, 'type': MoneyEnum.outcome, 'name': '住房'}, // 住房
    {'id': '4', 'icon': 0xe622, 'type': MoneyEnum.outcome, 'name': '衣服'}, // 衣服
    {'id': '5', 'icon': 0xe645, 'type': MoneyEnum.outcome, 'name': '其他'}, // 其他
  ];

  static List incomeList = [
    {'id': '6', 'icon': 0xe614, 'type': MoneyEnum.income, 'name': '工资'}, // 工资
    {'id': '7', 'icon': 0xe65d, 'type': MoneyEnum.income, 'name': '兼职'}, // 兼职
    {
      'id': '8',
      'icon': 0xe629,
      'type': MoneyEnum.income,
      'name': '其他收入'
    }, // 其他收入
  ];

  static List iconList = [...MyEnum.incomeList, ...MyEnum.outcomeList];

  static Map get iconMap {
    return list2map(iconList);
  }
}
