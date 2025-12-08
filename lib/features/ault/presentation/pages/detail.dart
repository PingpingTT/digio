import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final LaunchEntity launch;

  const Detail({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${launch.name} Details"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [launch.patchImage != null
              ? Image.network(launch.patchImage!)
              :const Icon(Icons.rocket_launch),
            
        ],
        )
        ),
    );
  }
}
