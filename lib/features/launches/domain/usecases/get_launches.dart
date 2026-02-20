import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/repositories/launch_repository.dart';

class GetLaunches {
  final LaunchRepository repository;

  GetLaunches(this.repository);

  Future<List<Launch>> call() {
    return repository.getLaunches();
  }
}
