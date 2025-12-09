import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
import 'package:digio_train/features/ault/presentation/pages/detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("SpaceX")),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search Launch",
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                context.read<SpaceXBloc>().add(FilterLaunchEvent(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SpaceXBloc, SpaceXState>(
              builder: (context, state) {
                if (state is SpaceXLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SpaceXError) {
                  return Center(child: Text('Error: ${state.message}'));
                }

                if (state is SpaceXLoaded) {
                  return _buildLaunchList(state.allEntity.Launches,state.allEntity);
                }

                if (state is SpaceXFilteredLaunches) {
                  return _buildLaunchList(state.filteredLaunches ,state.allEntity);
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLaunchList(List<LaunchEntity> launches , AllEntity allEntity) {
    return ListView.builder(
      itemCount: launches.length,
      itemBuilder: (context, index) {
        final launch = launches[index];

        return ListTile(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(allEntity: allEntity ,index:index,),
              ),
            );
          },
          leading: launch.patchImage != null
              ? Image.network(launch.patchImage!)
              :const Icon(Icons.rocket_launch),
          title: Text(launch.name),
          subtitle: Text(
            "Date: ${launch.dateUtc.toIso8601String().substring(0, 10)} - ${launch.success == true ? 'Success' : 'Failed'}",

          ),
        );
      },
    );
  }
}
