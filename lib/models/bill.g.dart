// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill()
    ..id = json['id'] as int
    ..type = json['type'] as int
    ..iconId = json['iconId'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..note = json['note'] as String
    ..dateStr = json['dateStr'] as String
    ..monthStr = json['monthStr'] as String
    ..yearStr = json['yearStr'] as String
    ..hasCost = json['hasCost'] as int;
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'iconId': instance.iconId,
      'price': instance.price,
      'note': instance.note,
      'dateStr': instance.dateStr,
      'monthStr': instance.monthStr,
      'yearStr': instance.yearStr,
      'hasCost': instance.hasCost,
    };
