// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      deskNr: json['deskNr'] as int,
      floorId: json['floorId'] as int,
      floorName: json['floorName'] as String,
      fullDate: json['fullDate'] as String,
      side: json['side'] as String,
      occupiedBy: json['occupiedBy'] as String,
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'deskNr': instance.deskNr,
      'floorId': instance.floorId,
      'floorName': instance.floorName,
      'fullDate': instance.fullDate,
      'side': instance.side,
      'occupiedBy': instance.occupiedBy,
    };
