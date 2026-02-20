import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/usecases/get_launches.dart';

/// EVENTS
abstract class LaunchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchLaunches extends LaunchEvent {}

/// STATES
abstract class LaunchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LaunchInitial extends LaunchState {}

class LaunchLoading extends LaunchState {}

class LaunchLoaded extends LaunchState {
  final List<Launch> launches;

  LaunchLoaded(this.launches);

  @override
  List<Object?> get props => [launches];
}

class LaunchError extends LaunchState {
  final String message;

  LaunchError(this.message);

  @override
  List<Object?> get props => [message];
}

/// BLOC
class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final GetLaunches getLaunches;

  LaunchBloc(this.getLaunches) : super(LaunchInitial()) {
    on<FetchLaunches>((event, emit) async {
      emit(LaunchLoading());

      try {
        final launches = await getLaunches();
        emit(LaunchLoaded(launches));
      } catch (e) {
        emit(LaunchError(e.toString()));
      }
    });
  }
}
