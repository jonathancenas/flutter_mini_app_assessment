import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'features/auth/presentation/pages/login_page.dart';
import 'features/launches/data/datasources/launch_remote_datasource.dart';
import 'features/launches/data/repositories/launch_repository_impl.dart';
import 'features/launches/domain/usecases/get_launches.dart';
import 'features/launches/presentation/bloc/launch_bloc.dart';

void main() {
  final dio = Dio();
  final datasource = LaunchRemoteDataSourceImpl(dio);
  final repository = LaunchRepositoryImpl(datasource);
  final usecase = GetLaunches(repository);

  runApp(MyApp(usecase));
}

class MyApp extends StatelessWidget {
  final GetLaunches usecase;

  const MyApp(this.usecase, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LaunchBloc(usecase),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
