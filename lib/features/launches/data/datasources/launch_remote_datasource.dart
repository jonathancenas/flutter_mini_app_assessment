import 'package:dio/dio.dart';
import 'package:flutter_mini_app_assessment/features/launches/data/models/launch_nodel.dart';

abstract class LaunchRemoteDataSource {
  Future<List<LaunchModel>> getLaunches();
}

class LaunchRemoteDataSourceImpl implements LaunchRemoteDataSource {
  final Dio dio;

  LaunchRemoteDataSourceImpl(this.dio);

  @override
  Future<List<LaunchModel>> getLaunches() async {
    final response = await dio.get('https://api.spacexdata.com/v4/launches');

    final data = response.data as List;

    return data.map((json) => LaunchModel.fromJson(json)).toList();
  }
}
