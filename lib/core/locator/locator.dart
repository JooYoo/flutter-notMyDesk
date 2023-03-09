import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/usecases/get_weekly_date_objs_uc.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/usecases/update_weekly_date_obj_uc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  // Data Sources
  locator.registerLazySingleton<WeeklyDateObjRemoteDataSourceProtocol>(
      () => WeeklyDateObjRemoteDataSource());

  // Repositories
  locator.registerLazySingleton<WeeklyDateObjRepoProtocol>(
      () => WeeklyDateObjRepo());

  // Use Cases
  locator.registerLazySingleton<GetWeeklyDateObjsUcProtocol>(
      () => GetWeeklyDateObjsUC());
  locator.registerLazySingleton<UpdateWeeklyDateObjUcProtocol>(
      () => UpdateWeeklyDateObjUC());
}
