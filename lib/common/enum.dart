// import 'package:flutter/material.dart';

Map list2map(List list, [String iconName = 'icon', String idName = 'id']) {
  Map map = {};
  list.forEach((v) {
    map[v['id']] = v['icon'];
  });
  return map;
}

enum MoneyEnum {
  income,
  outcome,
}
class MyEnum {
  static List iconList = [
    { 'id': '1', 'icon': 0xe612, 'type': MoneyEnum.outcome, }, // 食品
    { 'id': '2', 'icon': 0xe62b, 'type': MoneyEnum.outcome, }, // 交通
    { 'id': '3', 'icon': 0xe69c, 'type': MoneyEnum.outcome, }, // 住房
    { 'id': '4', 'icon': 0xe622, 'type': MoneyEnum.outcome, }, // 衣服
    { 'id': '5', 'icon': 0xe645, 'type': MoneyEnum.outcome, }, // 其他
    
    { 'id': '6', 'icon': 0xe614, 'type': MoneyEnum.income, }, // 工资
    { 'id': '7', 'icon': 0xe65d, 'type': MoneyEnum.income, }, // 兼职
    { 'id': '8', 'icon': 0xe629, 'type': MoneyEnum.income, }, // 其他收入
  ];

  static Map get iconMap {
    return list2map(iconList);
  }

}