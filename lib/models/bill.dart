import './base.dart';

import 'package:json_annotation/json_annotation.dart';
part 'bill.g.dart';

@JsonSerializable()
class Bill {
  @JsonKey(name: '_id')
  int id;
  String iconId;
  num price;
  String note;
  String date;
  int dateInt;
  int hasCost = 0;

  Bill();

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
