import 'package:equatable/equatable.dart';

class Launch extends Equatable {
  final String id;
  final String name;
  final DateTime date;
  final bool success;

  const Launch({
    required this.id,
    required this.name,
    required this.date,
    required this.success,
  });

  @override
  List<Object?> get props => [id, name, date, success];
}
