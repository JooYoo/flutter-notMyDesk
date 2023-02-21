import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';

abstract class GetWeeklyDateObjsUcProtocol {
  Future<List<WeeklyDateObj>> getWeeklyDateObjs();
}

class GetWeeklyDateObjsUC implements GetWeeklyDateObjsUcProtocol {
  // Dependency Injection
  final WeeklyDateObjRepoProtocol weeklyDateObjRepo;
  GetWeeklyDateObjsUC({required this.weeklyDateObjRepo});

  @override
  Future<List<WeeklyDateObj>> getWeeklyDateObjs() async {
    // Download objs from Fb
    var weeklyDateObjs = await weeklyDateObjRepo.downloadObjs();

    // If fb is empty,
    if (weeklyDateObjs.isEmpty) {
      // then generate new objs
      weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
      // upload generated objs into fb
      weeklyDateObjRepo.uploadObjs(weeklyDateObjs);
    }

    // If fb-objs are out of date
    // Delete objs

    // TODO: generateAndUploadObjsUC()
    // Generate new objs
    // upload generated objs into fb

    throw UnimplementedError();
  }
}
