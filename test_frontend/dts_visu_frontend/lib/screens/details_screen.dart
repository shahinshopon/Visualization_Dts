import 'dart:convert';
import 'package:dts_visu_frontend/data_controller.dart';
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:dts_visu_frontend/screens/coordinates_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
    this.wayPointsAllData,
    this.layersAllData,
    // this.webSocketAllData
   // this.stationNameData
  );
  var wayPointsAllData;
  List<Layers> layersAllData;
  // List webSocketAllData;
 // Map stationNameData;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final channel =
      WebSocketChannel.connect(Uri.parse('ws://0.0.0.0:5000/fts-data'));

  @override
  void initState() {
    strem();
    super.initState();
  }

  List<Map<String, dynamic>> sampleData = [
    {
      "id": 1,
      "x": 131972,
      "y": 190678,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.13"
    },
    {
      "id": 4,
      "x": 90115,
      "y": 191712,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.133"
    },
    {
      "id": 2,
      "x": 75716,
      "y": 159046,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.137"
    },
    {
      "id": 3,
      "x": 167156,
      "y": 181539,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.14"
    },
  ];

  List<Map<String, dynamic>> sampleDataForDrivingOrderFalse = [
    {
      "id": 1,
      "x": 131972,
      "y": 190678,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.13"
    },
    {
      "id": 4,
      "x": 90115,
      "y": 191712,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.133"
    },
    {
      "id": 2,
      "x": 75716,
      "y": 159046,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.137"
    },
    {
      "id": 3,
      "x": 167156,
      "y": 181539,
      "hasDrivingOrder": false,
      "time": "2024-03-26T16:00:03.14"
    },
  ];

  strem() async {
    try {
      await channel.ready;
      // channel.sink.close();
      // sampleData.clear();
      channel.stream.listen((message) {
        setState(() {
          Map<String, dynamic> valueMap = jsonDecode(message);

          // Check if new_data's id already exists in the list
          var existingIndex = valueMap['id'];
          for (var i in sampleData) {
            if (i['id'] == existingIndex
                // && valueMap['hasDrivingOrder'] == true
                ) {
              sampleData.remove(i);
              sampleData.add(valueMap);
            }
          }
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

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
            painter: CoordinatePainter(widget.wayPointsAllData, sampleData,
           // widget.stationNameData
            ),
          ),
        ),
      ),
    )
    );
  }
}
