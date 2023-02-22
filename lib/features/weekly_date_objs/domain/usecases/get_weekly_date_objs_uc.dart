import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/services/time_manager.dart';
import 'package:flutter_not_my_desk/services/weekly_floor_manager.dart';

abstract class GetWeeklyDateObjsUcProtocol {
  Future<List<WeeklyDateObj>> call();
}

class GetWeeklyDateObjsUC implements GetWeeklyDateObjsUcProtocol {
  // FIXME: try to use get_it
  // Dependency Injection
  final WeeklyDateObjRepoProtocol weeklyDateObjRepo;
  GetWeeklyDateObjsUC(this.weeklyDateObjRepo);

  @override
  Future<List<WeeklyDateObj>> call() async {
    // Download objs from Fb
    var weeklyDateObjs = await weeklyDateObjRepo.downloadObjs();

    // If fb is empty,
    if (weeklyDateObjs.isEmpty) {
      // then generate new objs and update to fb
      weeklyDateObjs = _generateAndUploadObjs();
    }

    // If fb-objs are out of date
    if (isWeeklyDateObjsOutOfDate(weeklyDateObjs)) {
      // Delete objs from fb
      await weeklyDateObjRepo.deleteObjs();
      // Generate new objs and update to fb
      weeklyDateObjs = _generateAndUploadObjs();
    }

    return weeklyDateObjs;
  }

  /* ---------------------------- Private funtions ---------------------------- */

  List<WeeklyDateObj> _generateAndUploadObjs() {
    // then generate new objs
    final weeklyDateObjs = generateWeeklyDateObjs([3, 4, 5]);
    // upload generated objs into fb
    weeklyDateObjRepo.uploadObjs(weeklyDateObjs);

    return weeklyDateObjs;
  }
}
