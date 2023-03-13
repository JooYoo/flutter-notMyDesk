import 'package:flutter_not_my_desk/core/locator/locator.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/WeeklyDateObj.dart';

abstract class WeeklyDateObjRepoProtocol {
  void uploadObjs(List<WeeklyDateObj> weeklyDateObjs);
  Future<List<WeeklyDateObj>> fetchObjs();
  Future<void> deleteObjs();
  Future<Map<String, dynamic>?> fetchCollectionBy(String? id);
  void updateCollectionBy(String? id, Map<String, dynamic> updatedCollection);
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
  Future<List<WeeklyDateObj>> fetchObjs() {
    return remoteDS.fetchObjs();
  }

  // Delete all weeklyDateObjs from Firebase
  @override
  Future<void> deleteObjs() async {
    await remoteDS.deleteObjs();
  }

  // Fetch collection (key-value-pair) by id from Fb
  // A part of updateObj
  @override
  Future<Map<String, dynamic>?> fetchCollectionBy(String? id) async {
    return await remoteDS.fetchCollectionBy(id);
  }

  // Update collection (key-value-pair) by id, new collection to Fb
  // A part of updateObj
  @override
  void updateCollectionBy(String? id, Map<String, dynamic> updatedCollection) {
    remoteDS.updateCollectionBy(id, updatedCollection);
  }
}
