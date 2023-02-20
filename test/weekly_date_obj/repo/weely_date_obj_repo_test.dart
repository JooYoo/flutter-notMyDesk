import 'package:flutter_not_my_desk/features/weekly_date_objs/data/datasources/weekly_date_obj_remote_data_source.dart';
import 'package:flutter_not_my_desk/features/weekly_date_objs/domain/repositories/weekly_date_obj_repo.dart';
import 'package:flutter_not_my_desk/models/WeeklyDateObj.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import './weely_date_obj_repo_test.mocks.dart';

// Mock remoteDS,
// as it's a part of the uploadObjs() and downloadObjs()
// generate mock to run `flutter pub run build_runner build`
@GenerateMocks([WeeklyDateObjRemoteDataSourceProtocol])
void main() {
  late MockWeeklyDateObjRemoteDataSourceProtocol mockRemoteDataSource;
  late WeeklyDateObjRepo sut;

  setUp(() {
    mockRemoteDataSource = MockWeeklyDateObjRemoteDataSourceProtocol();
    sut = WeeklyDateObjRepo(remoteDS: mockRemoteDataSource);
  });

  test('downloadObjs_whenFunctionIsCalled_thenShouldReturnMockedObjs',
      () async {
    // Given
    List<WeeklyDateObj> weeklyDateObjs = [
      WeeklyDateObj(fullDate: "2022-1-1", floors: List.empty()),
      WeeklyDateObj(fullDate: "2022-1-2", floors: List.empty())
    ];
    // When
    when(mockRemoteDataSource.downloadObjs())
        .thenAnswer((_) => Future(() => weeklyDateObjs));
    var res = await sut.downloadObjs();
    // Then
    verify(mockRemoteDataSource.downloadObjs()).called(1);
    expect(res.length, 2);
  });

  test('deleteObjs_whenFunctionIsCalled_thenCalledOnce', () {
    // When
    when(mockRemoteDataSource.deleteObjs())
        .thenAnswer((_) => Future(() => null));
    sut.deleteObjs();
    // Then
    verify(mockRemoteDataSource.deleteObjs()).called(1);
  });
}
