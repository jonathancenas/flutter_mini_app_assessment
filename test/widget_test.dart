import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/repositories/launch_repository.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/usecases/get_launches.dart';

class MockRepository extends Mock implements LaunchRepository {}

void main() {
  late GetLaunches usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetLaunches(mockRepository);
  });

  test('should return launches from repository', () async {
    final launches = [
      Launch(id: '1', name: 'Test Launch', date: DateTime.now(), success: true),
    ];

    when(() => mockRepository.getLaunches()).thenAnswer((_) async => launches);

    final result = await usecase();

    expect(result, launches);
    verify(() => mockRepository.getLaunches()).called(1);
  });
}
