// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeeklyDateObj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyDateObj _$WeeklyDateObjFromJson(
        DocumentSnapshot<Map<String, dynamic>> document,
        Map<String, dynamic> json) =>
    WeeklyDateObj(
      id: document.id,
      fullDate: json['fullDate'] as String,
      floors: (json['floors'] as List<dynamic>)
          .map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeeklyDateObjToJson(WeeklyDateObj instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullDate': instance.fullDate,
      'floors': instance.floors.map((e) => e.toJson()).toList(),
    };
