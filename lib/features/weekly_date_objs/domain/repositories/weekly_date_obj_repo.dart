import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/core/locator/locator.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepoProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> downloadObjs();
  Future<void> deleteObjs();
}

class WeeklyDateObjRepo implements WeeklyDateObjRepoProtocol {
  // Dependency Injection from RemoteDataSource
  final remoteDS = locator.get<WeeklyDateObjRemoteDataSourceProtocol>();

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

  // Delete all weeklyDateObjs from Firebase
  @override
  Future<void> deleteObjs() async {
    await remoteDS.deleteObjs();
  }
}
