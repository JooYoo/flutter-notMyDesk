import 'package:flutter/material.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepoProtocol {
  void createObjs(List<WeeklyDateObj> weeklyDateObjs);
  List<WeeklyDateObj> fetchWeeklyDateObjs();
  void deleteWeeklyDateObjs();
}

class WeeklyDateObjRepo implements WeeklyDateObjRepoProtocol {
  final WeeklyDateObjRemoteDataSourceProtocol remoteDS;

  WeeklyDateObjRepo({required this.remoteDS});

  @override
  void createObjs(List<WeeklyDateObj> weeklyDateObjs) {
    remoteDS.createObjs(weeklyDateObjs);
  }

  @override
  void deleteWeeklyDateObjs() {
    // TODO: implement deleteWeeklyDateObjs
  }

  @override
  List<WeeklyDateObj> fetchWeeklyDateObjs() {
    // TODO: implement fetchWeeklyDateObjs
    throw UnimplementedError();
  }
}
