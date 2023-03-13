import 'package:flutter_not_my_desk/core/locator/locator.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/data/models/WeeklyDateObj.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import './weely_date_obj_repo_test.mocks.dart';

// Mock remoteDS,
// as it's a part of the uploadObjs() and downloadObjs()
// generate mock to run `flutter pub run build_runner build`
@GenerateMocks([WeeklyDateObjRemoteDataSourceProtocol])
void main() {
  late WeeklyDateObjRemoteDataSourceProtocol remoteDSProtocol;
  late WeeklyDateObjRepo sut;

  setUp(() {
    // Get_it: register the mock-remoteDS to the real-remoteDS
    locator.registerLazySingleton<WeeklyDateObjRemoteDataSourceProtocol>(
        () => MockWeeklyDateObjRemoteDataSourceProtocol());
    // Dependecy injection: get the remoteDS which is now with the mock-remoteDS instance
    remoteDSProtocol = locator.get<WeeklyDateObjRemoteDataSourceProtocol>();

    sut = WeeklyDateObjRepo();
  });

  tearDown(() {
    // Unregiester mock after each test case,
    // so that the new mock can be registered for the next test case.
    locator.unregister<WeeklyDateObjRemoteDataSourceProtocol>();
  });

  test('downloadObjs_whenFunctionIsCalled_thenShouldReturnMockedObjs',
      () async {
    // Given
    List<WeeklyDateObj> weeklyDateObjs = [
      WeeklyDateObj(fullDate: "2022-1-1", floors: List.empty()),
      WeeklyDateObj(fullDate: "2022-1-2", floors: List.empty())
    ];

    // When
    when(remoteDSProtocol.fetchObjs())
        .thenAnswer((_) => Future(() => weeklyDateObjs));

    /// The implementation of `downloadObjs()` is inside of remoteDS,
    /// it's now mocked, including mocked data.
    var res = await sut.fetchObjs();

    // Then
    verify(remoteDSProtocol.fetchObjs()).called(1);
    expect(res.length, 2);
  });

  test('deleteObjs_whenFunctionIsCalled_thenCalledOnce', () {
    // When
    when(remoteDSProtocol.deleteObjs()).thenAnswer((_) => Future(() => null));
    sut.deleteObjs();
    // Then
    verify(remoteDSProtocol.deleteObjs()).called(1);
  });
}
