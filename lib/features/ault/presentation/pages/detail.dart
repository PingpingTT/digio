import 'package:collection/collection.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail extends StatelessWidget {
  final int index;

  const Detail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceXBloc, SpaceXState>(
      builder: (context, state) {
        if (state is SpaceXLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is SpaceXLoaded || state is SpaceXFilteredLaunches) {
          final all = (state is SpaceXLoaded)
              ? state.allEntity
              : (state as SpaceXFilteredLaunches).allEntity;

          final launch = all.Launches[index];

          final launchpad = all.Launchpads.firstWhereOrNull(
            (lp) => lp.id == launch.launchpadId,
          );

          final rocket = all.Rockets.firstWhereOrNull(
            (r) => r.id == launch.rocketId,
          );

          final landpad = all.Landpads.firstWhereOrNull(
            (lp) => lp.id == launch.landpadId,
          );

          return _buildDetailUI(launch, launchpad, rocket, landpad);
        }

        return const Scaffold(body: Center(child: Text("No Data Found")));
      },
    );
  }

  Widget _buildDetailUI(launch, launchpad, rocket, landpad) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${launch.name} Details"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),

          launch.patchImage != null
              ? Image.network(launch.patchImage!)
              : const Icon(Icons.rocket_launch, size: 80),

          const SizedBox(height: 20),

          if (launchpad != null) ...[
            Text("Launchpad", style: _titleStyle),
            Text(launchpad.fullname),
            const SizedBox(height: 10),
            Text("Date & Status", style: _titleStyle),
            Text(
              "${launch.dateUtc.toLocal()} - "
              "${launch.success == true ? 'Success' : 'Failed'}",
            ),
            const SizedBox(height: 20),

            if (launchpad.images.isNotEmpty)
            Text("Launchpad", style: _titleStyle),
              Image.network(launchpad.images.first),

            const SizedBox(height: 10),

            Text("Launchpad Detail", style: _titleStyle),
            Text(launchpad.details ?? "No details available"),
          ] else
            _errorText("Launchpad not found"),

          const SizedBox(height: 30),

          if (rocket != null) ...[
            Text("Rocket", style: _titleStyle),
            if (rocket.flickrImages != null && rocket.flickrImages!.isNotEmpty)
              Image.network(rocket.flickrImages!.first),
            const SizedBox(height: 10),
            Text("Rocket Details", style: _titleStyle),
            Text(rocket.description ?? "No rocket details"),
          ] else
            _errorText("Rocket not found"),

          const SizedBox(height: 30),

          if (landpad != null) ...[
            Text("Landpad", style: _titleStyle),
            Image.network(landpad.images.first),
            const SizedBox(height: 10),
            Text("Landpad Detail", style: _titleStyle),
            Text(landpad.details ?? "No landpad details"),
          ] else
            _errorText("Landpad not found"),
        ],
      ),
    );
  }

  TextStyle get _titleStyle =>
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  Widget _errorText(String msg) => Padding(
    padding: const EdgeInsets.all(10),
    child: Text(msg, style: const TextStyle(color: Colors.red)),
  );
}
