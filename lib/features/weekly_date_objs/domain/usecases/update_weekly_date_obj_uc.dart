import 'package:flutter_not_my_desk/core/locator/locator.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/Seat.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';

abstract class UpdateWeeklyDateObjUcProtocol {
  void call(List<WeeklyDateObj> currWeeklyDateObjs, Seat targetNewSeat);
}

class UpdateWeeklyDateObjUC implements UpdateWeeklyDateObjUcProtocol {
  // Dependency injection
  final weeklyDateObjRepo = locator.get<WeeklyDateObjRepoProtocol>();

  @override
  void call(List<WeeklyDateObj> currWeeklyDateObjs, Seat targetNewSeat) async {
    // Find target-week
    final collectionID =
        _getTargetCollectionId(currWeeklyDateObjs, targetNewSeat);

    // Fetch target-collection (root collection) from Fb
    var targetCollection =
        await weeklyDateObjRepo.fetchCollectionBy(collectionID);

    // Update occupiedBy in nested collection
    targetCollection = _updateTargetCollection(targetCollection, targetNewSeat);

    // upload the updated-target-collection into Fb
    weeklyDateObjRepo.updateCollectionBy(collectionID, targetCollection);
  }

  /* ---------------------------- Private functions --------------------------- */

  // Get target collection (root key-value-pair in Fb) Id
  String? _getTargetCollectionId(
      List<WeeklyDateObj> currWeeklyDateObjs, Seat targetNewSeat) {
    // find the weekly-date-obj which the new-seat belongs to
    final targetWeeklyDateObj = currWeeklyDateObjs
        .firstWhere((obj) => obj.fullDate == targetNewSeat.fullDate);
    // get colletion-id (target-weekly-date-obj)
    final collectionID = targetWeeklyDateObj.id;

    return collectionID;
  }

  // Update target-collection `occupiedBy` in nested collection
  Map<String, dynamic> _updateTargetCollection(
      Map<String, dynamic>? targetCollection, Seat targetNewSeat) {
    var fbFloors = targetCollection!['floors']
        .map((item) => item as Map<String, dynamic>)
        .toList();
    var fbFloor =
        fbFloors.firstWhere((item) => item['id'] == targetNewSeat.floorId);
    var fbSeat = fbFloor['seats']
        .firstWhere((item) => item['deskNr'] == targetNewSeat.deskNr);
    fbSeat['occupiedBy'] = targetNewSeat.occupiedBy;

    return targetCollection;
  }
}
