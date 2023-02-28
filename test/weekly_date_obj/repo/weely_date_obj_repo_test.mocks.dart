// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_not_my_desk/test/weekly_date_obj/repo/weely_date_obj_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart'
    as _i2;
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [WeeklyDateObjRemoteDataSourceProtocol].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeeklyDateObjRemoteDataSourceProtocol extends _i1.Mock
    implements _i2.WeeklyDateObjRemoteDataSourceProtocol {
  MockWeeklyDateObjRemoteDataSourceProtocol() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void uploadObjs(List<_i3.WeeklyDateObj>? weeklyDateObjs) =>
      super.noSuchMethod(
        Invocation.method(
          #uploadObjs,
          [weeklyDateObjs],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<List<_i3.WeeklyDateObj>> downloadObjs() => (super.noSuchMethod(
        Invocation.method(
          #downloadObjs,
          [],
        ),
        returnValue:
            _i4.Future<List<_i3.WeeklyDateObj>>.value(<_i3.WeeklyDateObj>[]),
      ) as _i4.Future<List<_i3.WeeklyDateObj>>);
  @override
  _i4.Future<void> deleteObjs() => (super.noSuchMethod(
        Invocation.method(
          #deleteObjs,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void updateObjBy(
    String? objId,
    Map<String, dynamic>? updatedObj,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #updateObjBy,
          [
            objId,
            updatedObj,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
