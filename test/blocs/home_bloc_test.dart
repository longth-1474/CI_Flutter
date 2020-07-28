import 'package:bloc_test/bloc_test.dart';
import 'package:com.ci.flutter/blocs/blocs.dart';
import 'package:com.ci.flutter/data/repository/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

main() {
  final String successData = "Data loaded";
  final dynamic errorData = "Data error";

  group("HomeBloc", () {
    HomeBloc homeBloc;
    MockHomeRepository repository;
    setUp(() {
      repository = MockHomeRepository();
      homeBloc = HomeBloc(homeRepository: repository);
    });
    tearDown(() {
      homeBloc.close();
    });
    test("initial state is InitState", () {
      expect(homeBloc.state, InitState());
    });
    group("test event GetData", () {
      blocTest(
        "emits [LoadingState, LoadedState] when GetData success",
        build: () async {
          when(repository.getData()).thenAnswer((_) => Future.value(successData));
          return homeBloc;
        },
        act: (bloc) => bloc.add(GetData()),
        expect: [LoadingState(), LoadedState<String>(data: successData)],
      );
      blocTest(
        "emits [LoadingState, ErrorState] when GetData failure",
        build: () async {
          when(repository.getData()).thenThrow(errorData);
          return homeBloc;
        },
        act: (bloc) => bloc.add(GetData()),
        expect: [LoadingState(), ErrorState(data: errorData)],
      );
    });
  });
}
