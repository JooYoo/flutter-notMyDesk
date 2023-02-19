import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepoProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> downloadObjs();
}

class WeeklyDateObjRepo implements WeeklyDateObjRepoProtocol {
  // Dependency Injection from RemoteDataSource
  final WeeklyDateObjRemoteDataSourceProtocol remoteDS;
  WeeklyDateObjRepo({required this.remoteDS});

  // Upload WeeklyDateObjs into FireStore based on collection name
  @override
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs) {
    remoteDS.uploadObjs(weeklyDateObjs);
  }

  // Download WeeklyDateObjs into FireStore based on collection name
  @override
  Future<List<WeeklyDateObj>> downloadObjs() {
    return remoteDS.downloadObjs();
  }
}
