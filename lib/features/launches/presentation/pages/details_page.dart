import 'package:flutter/material.dart';
import 'package:flutter_mini_app_assessment/features/launches/domain/entities/launch.dart';

class DetailsPage extends StatelessWidget {
  final Launch launch;

  const DetailsPage(this.launch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(launch.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(launch.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('Date: ${launch.date.toLocal()}'),
            Text('Success: ${launch.success}'),
            Text('ID: ${launch.id}'),
          ],
        ),
      ),
    );
  }
}
