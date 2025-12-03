import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
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
        title: Center(child: Text("SpaceX")),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Locket",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<SpaceXBloc, SpaceXState>(
                builder: (context, state) {
                  if (state is SpaceXLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is SpaceXError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } 
                  if (state is SpaceXLoaded) {
                    allEntity = state.allEntity;

                  }
                  if (state is SpaceXFilteredLaunches) {
                  launches = state.launches;
                  }
            
                return ListView.builder(
                  itemCount: state.launches.length,
                  itemBuilder: (context, index) {
                    final launch = state.launches[index];
                    return ListTile(
                      title: Text(launch.missionName),
                      subtitle: Text(launch.rocket.rocketName),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(),
                        //   ),
                        // );
                      },
                    );
                  },
                );
               },
            )
        ],
          ),
      );
  }
}
