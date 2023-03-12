// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      id: json['id'] as int,
      floorName: json['floorName'] as String,
      fullDate: json['fullDate'] as String,
      seats: (json['seats'] as List<dynamic>)
          .map((e) => Seat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'id': instance.id,
      'floorName': instance.floorName,
      'fullDate': instance.fullDate,
      'seats': instance.seats.map((e) => e.toJson()).toList(),
    };
