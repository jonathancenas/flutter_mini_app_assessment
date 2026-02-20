import 'package:flutter_mini_app_assessment/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/repositories/launch_repository.dart';

class LaunchRepositoryImpl implements LaunchRepository {
  final LaunchRemoteDataSource remoteDataSource;

  LaunchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Launch>> getLaunches() async {
    final launches = await remoteDataSource.getLaunches();

    // Sort newest first and limit results (important polish)
    launches.sort((a, b) => b.date.compareTo(a.date));

    return launches.take(20).toList();
  }
}
