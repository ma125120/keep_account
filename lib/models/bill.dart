// import './base.dart';

import 'package:json_annotation/json_annotation.dart';
part 'bill.g.dart';

@JsonSerializable()
class Bill {
  // @JsonKey(name: columnId)
  int id;
  int type = 0;
  // 消费的类型图标id
  String iconId;
  // 花费
  double price;
  // 备注
  String note;

  // 日期字符串
  String dateStr;
  // 日期字符串
  String monthStr;
  // 日期字符串
  String yearStr;
  // 是否为信用卡等消费
  int hasCost = 1;

  Bill();

  double get realPrice => (type == 0 ? -1 : 1) * price;
  String get priceStr => (type == 0 ? '-' : '+') + price.toString();

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
