// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill()
    ..id = json['_id'] as int
    ..iconType = json['iconType'] as String
    ..price = json['price'] as num
    ..note = json['note'] as String
    ..date = json['date'] as String;
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      '_id': instance.id,
      'iconType': instance.iconType,
      'price': instance.price,
      'note': instance.note,
      'date': instance.date,
    };
