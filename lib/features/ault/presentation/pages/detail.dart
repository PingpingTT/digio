import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/domain/entity/landpad_entity.dart';
import 'package:digio_train/features/ault/domain/entity/launchpad_entity.dart';
import 'package:digio_train/features/ault/domain/entity/rockets_entity.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final AllEntity allEntity;
  final int index;

  const Detail({super.key, required this.allEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    final launch = allEntity.Launches[index];

    LaunchpadEntity? launchpad;

    try {
      launchpad = allEntity.Launchpads.firstWhere(
        (lp) => lp.id == launch.launchpadId,
      );
    } catch (e) {
      launchpad = null;
    }

    LandpadEntity? landpad;
    try {
      landpad = allEntity.Landpads.firstWhere(
        (lp) => lp.id == launch.landpadId,
      );
    } catch (e) {
      landpad = null;
    }
    RocketsEntity? rockets;
    try {
      rockets =
          allEntity.Rockets.firstWhere((lp) => lp.id == launch.rocketId)
              as RocketsEntity?;
    } catch (e) {
      rockets = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${launch.name} Details"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          const SizedBox(height: 20),

          launch.patchImage != null
              ? Image.network(launch.patchImage!)
              : const Icon(Icons.rocket_launch),

          const SizedBox(height: 20),

          if (launchpad != null)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(launchpad.fullname),
                  SizedBox(height: 10),
                  Text(
                    "Date Luanch & Status ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "${launch.dateUtc.toLocal()} - ${launch.success == true ? 'Success' : 'Failed'}",
                  ),
                ],
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Launchpad / Landpad not found",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          //Launcghpad Image and Details
          if (launchpad != null && launchpad.images.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(launchpad.images.first),
                  const SizedBox(height: 20),
                  Text(
                    "Lanchpad Detail ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(launchpad.details ?? "No launchpad details"),
                ],
              ),
            )
          else
            const Icon(Icons.image_not_supported),

          //Rocket Image and Details
          if (rockets != null && rockets.flickrImages!.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(rockets.flickrImages!.first),
                  const SizedBox(height: 20),
                  Text(
                    "Rocket Detail ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(rockets.description ?? "No rocket details"),
                ],
              ),
            )
          else
            const Icon(Icons.image_not_supported),
          //Landpad Details
          if (landpad != null)
            Padding(
              padding: EdgeInsets.all(20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(landpad.images.first),
                const SizedBox(height: 20),
                  Text( "Landpad Detail ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  const SizedBox(height: 10),
                    Text(landpad.details ?? "No landpad details"),
                ],
              )
            )
          else
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Landpad not found details",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
