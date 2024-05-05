import 'dart:convert';
import 'package:dts_visu_frontend/const/app_colors.dart';
import 'package:dts_visu_frontend/const/app_styles.dart';
import 'package:dts_visu_frontend/helper/waypoints_helper.dart';
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:dts_visu_frontend/screens/details_screen.dart';
import 'package:dts_visu_frontend/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WayPointsModel? waypoint;
  bool isLoaded = false;
  getWaypointData() async {
    try {
      waypoint = await TDSWaypointsHelper().getTDSWaypoints();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoaded = true;
      });
    });
    } catch (e) {
      failedSnackBar(message: e.toString());
    }
  }

  @override
  void initState() {
    getWaypointData();
    socketBox = Hive.box('socketBox');
    getData();
    super.initState();
  }

  Box? socketBox;
  List socketData = [];

  getData() async {
    try {
      Future.delayed(const Duration(seconds: 3), () {
      for (var i = 0; i < socketBox!.keys.toList().length; i++) {
        Map valueMap = jsonDecode(socketBox!.getAt(i));
        if (socketData.contains(valueMap)) {
        } else {
          socketData.add(valueMap);
        }
      }
    });
    } catch (e) {
      failedSnackBar(message: e.toString());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded == false
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: waypoint!.layers!.length,
              itemBuilder: (_, index) {
                List<Waypoints> wayPointsAllData = waypoint!.waypoints!;
                List<Layers> layersAllData = waypoint!.layers!;
                List webSocketAllData = socketData;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                wayPointsAllData,
                                layersAllData,
                                webSocketAllData)));
                  },
                  child: Container(
                    color: amberColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Layer Name : ${waypoint!.layers![index].name}',
                          style:  fontTitle,
                        ),
                        normalTextWidget('xMax : ${waypoint!.layers![index].xMax}'),
                        normalTextWidget('xMin : ${waypoint!.layers![index].xMin}'),
                        normalTextWidget('yMax : ${waypoint!.layers![index].yMax}'),
                        normalTextWidget('yMin : ${waypoint!.layers![index].yMin}')
                        
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            ),
    );
  }
}
