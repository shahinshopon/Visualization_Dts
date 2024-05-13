
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:dts_visu_frontend/screens/coordinates_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      this.wayPointsAllData, this.layersAllData, this.webSocketAllData);
  var wayPointsAllData;
  List<Layers> layersAllData;
  List webSocketAllData;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: CoordinatePainter(
                widget.wayPointsAllData, widget.webSocketAllData),
          ),
        ),
      ),
    ));
  }
}