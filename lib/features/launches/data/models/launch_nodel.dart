import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';

class LaunchModel extends Launch {
  const LaunchModel({
    required super.id,
    required super.name,
    required super.date,
    required super.success,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      id: json['id'],
      name: json['name'] ?? 'No Name',
      date: DateTime.parse(json['date_utc']),
      success: json['success'] ?? false,
    );
  }
}
