import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_app_assessment/features/launches/presentation/bloc/launch_bloc.dart';
import 'package:flutter_mini_app_assessment/features/launches/presentation/pages/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SpaceX Launches')),
      body: BlocBuilder<LaunchBloc, LaunchState>(
        builder: (context, state) {
          if (state is LaunchLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LaunchLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<LaunchBloc>().add(FetchLaunches());
              },
              child: ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, index) {
                  final launch = state.launches[index];

                  return ListTile(
                    title: Text(launch.name),
                    subtitle: Text(
                      '${launch.date.toLocal()} • ${launch.success ? "Success" : "Fail"}',
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailsPage(launch)),
                      );
                    },
                  );
                },
              ),
            );
          }

          if (state is LaunchError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
