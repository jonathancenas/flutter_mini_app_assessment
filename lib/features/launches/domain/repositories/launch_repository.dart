import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';

abstract class LaunchRepository {
  Future<List<Launch>> getLaunches();
}
