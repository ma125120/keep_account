// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill()
    ..id = json['_id'] as int
    ..iconId = json['iconId'] as String
    ..price = json['price'] as num
    ..note = json['note'] as String
    ..date = json['date'] as String
    ..dateInt = json['dateInt'] as int
    ..hasCost = json['hasCost'] as int;
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      '_id': instance.id,
      'iconId': instance.iconId,
      'price': instance.price,
      'note': instance.note,
      'date': instance.date,
      'dateInt': instance.dateInt,
      'hasCost': instance.hasCost,
    };
