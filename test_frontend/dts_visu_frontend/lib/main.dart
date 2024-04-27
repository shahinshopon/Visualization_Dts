import 'dart:convert';
import 'package:dts_visu_frontend/helper/waypoints_helper.dart';
import 'package:dts_visu_frontend/model/new_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('socketBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DTS Visualization',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      // ),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewModelTwo? waypoint;
  bool isLoaded = false;
  getWaypointData() async {
    waypoint = await TDSWaypointsHelper().getTDSWaypoints();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoaded = true;
      });
    });
    
  }

  // Box? socketBox;

  @override
  void initState() {
   //  socketBox!.delete('socketBox');
  // Hive.box('socketBox').clear();
    getWaypointData();
    socketBox = Hive.box('socketBox');
    getData();
    super.initState();
  }

  ///////////////
  Box? socketBox;
  List socketData = [];

  getData() async {
    Future.delayed(Duration(seconds: 3), () {
      for (var i = 0; i < socketBox!.keys.toList().length; i++) {
        Map valueMap = jsonDecode(socketBox!.getAt(i));
        socketData.add(valueMap);
       // print(socketData);
      }
    });
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
//                 for (var i = 0; i < 13; i++) {
//    socketData.add(socketBox!.getAt(i)) ;
// print(socketData);
//   }

                // print(socketBox?.getAt(index));
                //  var  check =[];
                //    for (var i = 0; i < wayPointsAllData.length; i++) {
                //      if (layersAllData[index].xMax! >= wayPointsAllData[i].x! && layersAllData[index].xMin! <= wayPointsAllData[i].x!) {
                //       check.add(wayPointsAllData[i].x!);
                //     }
                //    }
                //   print(check.length);
                //   print(check);
                //  wayPointsAllData.sort((a, b) => a.y!.compareTo(b.y as num),);

                // wayPointsAllData.forEach((element) {print(element.y);});
                return InkWell(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Two(webSocketAllData)));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                wayPointsAllData,
                                layersAllData,
                                webSocketAllData)));
                  },
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Layer Name : ${waypoint!.layers![index].name}',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                        Text('xMax : ${waypoint!.layers![index].xMax}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        Text('xMin : ${waypoint!.layers![index].xMin}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        Text('yMax : ${waypoint!.layers![index].yMax}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        Text('yMin : ${waypoint!.layers![index].yMin}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
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
    // print(widget.webSocketAllData);
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: MediaQuery.of(context)
              .size
              .height,
          height: MediaQuery.of(context)
              .size
              .width, 
          child: CustomPaint(
            painter: CoordinatePainter(
                widget.wayPointsAllData, widget.webSocketAllData),
          ),
        ),
      ),
    ));
  }
}

class CoordinatePainter extends CustomPainter {
  final List<Waypoints> coordinates;
  List webSocketAllData;

  CoordinatePainter(this.coordinates, this.webSocketAllData);

  @override
  void paint(Canvas canvas, Size size) {
    // Reverse y axix
    // canvas.translate(0.0, size.height);
    // canvas.scale(1.0,-1.0);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // Define the range of your coordinates
    final double minX = 56343;
    final double maxX = 187040;
    final double minY = 142579;
    final double maxY = 199628;

    //Define the range of your dts value
    final double minXForDts = 56276;
    final double maxXForDts = 176074;
    final double minYForDts = 142570;
    final double maxYForDts = 198682;

    // Define the size of the canvas to map the coordinates to
    final double canvasWidth = size.width;
    final double canvasHeight = size.height;

    // Map each coordinate to the canvas size
    final List<Offset> mappedCoordinates = coordinates.map((coordinate) {
      final double x = (coordinate.x! - minX) / (maxX - minX) * canvasWidth;
      final double y = (-(coordinate.y! - maxY) / (maxY - minY) * canvasHeight);
      return Offset(x, y);
    }).toList();
    // final List<Offset> mappedCoordinates = mappedCoordinatesOne.reversed.toList();
    //  for (int i = 0; i < mappedCoordinates.length - 1; i++) {
    // //  final startPoint = Offset(coordinates[i]['x'].toDouble(), coordinates[i]['y'].toDouble());
    //  // final endPoint = Offset(coordinates[i + 1]['x'].toDouble(), coordinates[i + 1]['y'].toDouble());
    //  canvas.drawLine(mappedCoordinates[i], mappedCoordinates[i+1], paint);

    // }

    // Draw lines connecting the coordinates
    // for (int i = 0; i < mappedCoordinates.length - 1; i++) {
    //   canvas.drawLine(mappedCoordinates[i], mappedCoordinates[i + 1], paint);
    // }

    for (int i = 0; i < mappedCoordinates.length - 1; i++) {
      // paint.color = Colors.black;
      //canvas.drawCircle(Offset(waypoint.x, waypoint.y), 2, paint);
      // Draw the 'x' mark
      canvas.drawLine(
        Offset(mappedCoordinates[i].dx - 3, mappedCoordinates[i].dy - 3),
        Offset(mappedCoordinates[i].dx + 3, mappedCoordinates[i].dy + 3),
        paint,
      );
      canvas.drawLine(
        Offset(mappedCoordinates[i].dx - 3, mappedCoordinates[i].dy + 3),
        Offset(mappedCoordinates[i].dx + 3, mappedCoordinates[i].dy - 3),
        paint,
      );
    }
    // canvas.translate(size.width/2, size.height);
    //  canvas.scale(1.0- 0.5);
    // canvas.restore();
    //canvas.rotate(-3.14);

    // for station number start
    TextPainter painterOne;
    painterOne = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    // for station number end
    // for station name start
    TextPainter painterTwo;
    painterTwo = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    // Rotate canvas text by 180 degrees
    // canvas.rotate(180 * 3.1415926535 / 180);

    // for station name end
    var stationNumber = 0;
    for (int i = 0; i < coordinates.length - 1; i++) {
      if (coordinates[i].isStation == true) {
        //start add for query If there is a driving order
        for (var j = 0; j < webSocketAllData.length; j++) {
          if (webSocketAllData[j]['hasDrivingOrder'] == true) {
            if (webSocketAllData[j]['destination'] ==
                    coordinates[i].stationName ||
                webSocketAllData[j]['source'] == coordinates[i].stationName) {
              paint.color = Colors.black;
            }
          }
        }
       //end add for query If there is a driving order
        canvas.drawRect(
          Rect.fromCenter(
              center: Offset(mappedCoordinates[i].dx, mappedCoordinates[i].dy),
              width: 16,
              height: 16),
          paint,
        );

        //canvas.scale(1.0,-1.0);
        // for station number start
        stationNumber++;
        painterOne.text = TextSpan(
          text: '$stationNumber',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11.0,
          ),
        );

        Offset position = Offset(
          mappedCoordinates[i].dx - 6.0,
          mappedCoordinates[i].dy - 6.0,
        );
        painterOne.layout();
        painterOne.paint(canvas, position);
        // for station number end

        // for station name start
        painterTwo.text = TextSpan(
          text: coordinates[i].stationName,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 8.0,
          ),
        );
        Offset positionTwo = Offset(
          mappedCoordinates[i].dx + 12.0,
          mappedCoordinates[i].dy + 8.0,
        );
        painterTwo.layout();
        painterTwo.paint(canvas, positionTwo);
        // for station name end
      }
    }

    // Draw DTS
    List mappedCoordinatesNew = webSocketAllData.map((coordinate) {
      final double x = (coordinate['x'] - minXForDts) / (maxXForDts - minXForDts) * canvasWidth;
      final double y =
          (-(coordinate['y'] - maxYForDts) / (maxYForDts - minYForDts) * canvasHeight);
      return Offset(x, y);
    }).toList();

    for (int i = 0; i < mappedCoordinatesNew.length - 1; i++) {
      paint.color = Colors.black;
      canvas.drawCircle(
          Offset(mappedCoordinatesNew[i].dx, mappedCoordinatesNew[i].dy),
          2,
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// class CoordinateVisualization extends StatelessWidget {
//   var data;
//   @override
//   Widget build(BuildContext context) {
//     final List<Waypoints> coordinates = <Waypoints> [
//       Waypoints(x, y),
//       Offset(100000, 170000),
//       Offset(150000, 180000),
//       Offset(187040, 199628),
//       Offset(162829, 175637)
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Coordinate Visualization'),
//       ),
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.height, // Adjust this according to your needs
//           height: MediaQuery.of(context).size.width, // Adjust this according to your needs
//           child: CustomPaint(
//             painter: CoordinatePainter(coordinates),
//           ),
//         ),
//       ),
//     );
//   }
// }
