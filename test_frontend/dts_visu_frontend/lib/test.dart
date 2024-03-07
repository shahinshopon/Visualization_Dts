import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Waypoint {
  final double x;
  final double y;
  final int layer;

  Waypoint(this.x, this.y, this.layer);
}

class Layer {
  final List<Waypoint> waypoints;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  Layer(this.waypoints, this.minX, this.maxX, this.minY, this.maxY);
}

class Station {
  final double x;
  final double y;
  final String name;

  Station(this.x, this.y,this.name);
}

class DTS {
  final double x;
  final double y;

  DTS(this.x, this.y);
}

// class DTSVisualizationApp extends StatelessWidget {
//   final List<Layer> layers = [
//     Layer([
//       Waypoint(100, 100, 1),
//       Waypoint(200, 100, 1),
//       Waypoint(200, 200, 1),
//       Waypoint(100, 200, 1),

//     ], 0, 300, 0, 300),
//     Layer([
//       Waypoint(150, 150, 2),
//       Waypoint(250, 150, 2),
//       Waypoint(250, 250, 2),
//       Waypoint(150, 250, 2),
//     ], 100, 400, 100, 400),
//   ];

//   final List<Station> stations = [
//     Station(50, 50),
//     Station(250, 250),
//   ];

//   final List<DTS> dtsList = [
//     DTS(200, 50, Colors.blue),
//     DTS(50, 200, Colors.green),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DTS Visualization',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Driverless Transport System'),
//         ),
//         body: Center(
//           child: Container(
//             width: double.maxFinite,
//             height: 700,
//             color: Colors.grey[300],
//             child: CustomPaint(
//               painter: DTSVisualizationPainter(layers, stations, dtsList),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DTSVisualizationPainter extends CustomPainter {
//   final List<Layer> layers;
//   final List<Station> stations;
//   final List<DTS> dtsList;

//   DTSVisualizationPainter(this.layers, this.stations, this.dtsList);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     // Draw waypoints in each layer and connect them with lines
//     for (final layer in layers) {
//       // Draw lines
//       for (int i = 0; i < layer.waypoints.length - 1; i++) {
//         final waypoint1 = layer.waypoints[i];
//         final waypoint2 = layer.waypoints[i + 1];
//         paint.color = Colors.black;
//         paint.strokeWidth = 2.0;
//         canvas.drawLine(Offset(waypoint1.x, waypoint1.y), Offset(waypoint2.x, waypoint2.y), paint);
//       }

//       // Draw waypoints
//       for (final waypoint in layer.waypoints) {
//         paint.color = Colors.black;
//         canvas.drawCircle(Offset(waypoint.x, waypoint.y), 4, paint);
//         // Draw the 'x' mark
//         canvas.drawLine(
//           Offset(waypoint.x - 4, waypoint.y - 4),
//           Offset(waypoint.x + 4, waypoint.y + 4),
//           paint,
//         );
//         canvas.drawLine(
//           Offset(waypoint.x - 4, waypoint.y + 4),
//           Offset(waypoint.x + 4, waypoint.y - 4),
//           paint,
//         );
//       }
//     }

//     // Draw stations
//     for (final station in stations) {
//       paint.color = Colors.red;
//       canvas.drawRect(
//         Rect.fromCenter(center: Offset(station.x, station.y), width: 20, height: 20),
//         paint,
//       );
//     }

//     // Draw DTS
//     for (final dts in dtsList) {
//       paint.color = dts.color;
//       canvas.drawCircle(Offset(dts.x, dts.y), 10, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


//new 

// class DTSVisualizationApp extends StatelessWidget {
//   final List<Layer> layers = [
//     Layer([
//       Waypoint(300, 650, 1),
//       Waypoint(300, 600, 1),
//       Waypoint(200, 600, 1),
//       Waypoint(200, 500, 1),
//       Waypoint(300, 500, 1),
//       Waypoint(300, 440, 1),
//       Waypoint(300, 400, 1),
//     ], 0, 300, 0, 300),
//     Layer([
//       Waypoint(300, 500, 4),
//       Waypoint(340, 470, 4),
//       Waypoint(420, 470, 4),
//       Waypoint(440, 450, 4),
//       Waypoint(500, 450, 4),
//       Waypoint(550, 450, 4),
//       Waypoint(610, 450, 4),
//       Waypoint(630, 470, 4),
//     ], 0, 300, 0, 300),
//     Layer([
//       Waypoint(80, 530, 2),
//       Waypoint(80, 580, 2),
//       Waypoint(100, 600, 2),
//       Waypoint(200, 600, 2),
//     ], 0, 300, 0, 300),
//     Layer([
//       Waypoint(150, 600, 3),
//       Waypoint(150, 650, 3),
//     ], 0, 300, 0, 300),
//   ];

//   final List<Station> stations = [
//     Station(50, 50),
//     Station(250, 250),
//   ];

//   final List<DTS> dtsList = [
//     DTS(300, 650),
//     DTS(150, 650),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DTS Visualization',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Driverless Transport System'),
//         ),
//         body: Center(
//           child: Container(
//             width: double.maxFinite,
//             height: 700,
//             color: Colors.grey[300],
//             child: CustomPaint(
//               painter: DTSVisualizationPainter(layers, stations, dtsList),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DTSVisualizationPainter extends CustomPainter {
//   final List<Layer> layers;
//   final List<Station> stations;
//   final List<DTS> dtsList;

//   DTSVisualizationPainter(this.layers, this.stations, this.dtsList);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     // Draw waypoints in each layer and connect them with lines
//     for (final layer in layers) {
//       // Draw lines
//       for (int i = 0; i < layer.waypoints.length - 1; i++) {
//         final waypoint1 = layer.waypoints[i];
//         final waypoint2 = layer.waypoints[i + 1];
//         paint.color = Colors.black;
//         paint.strokeWidth = 2.0;
//         canvas.drawLine(Offset(waypoint1.x, waypoint1.y),
//             Offset(waypoint2.x, waypoint2.y), paint);
       
//       }

//       // Draw waypoints
//       // for (final waypoint in layer.waypoints) {
//       //   paint.color = Colors.black;
//       //   //canvas.drawCircle(Offset(waypoint.x, waypoint.y), 2, paint);
//       //   // Draw the 'x' mark
//       //   canvas.drawLine(
//       //     Offset(waypoint.x - 4, waypoint.y - 4),
//       //     Offset(waypoint.x + 4, waypoint.y + 4),
//       //     paint,
//       //   );
//       //   canvas.drawLine(
//       //     Offset(waypoint.x - 4, waypoint.y + 4),
//       //     Offset(waypoint.x + 4, waypoint.y - 4),
//       //     paint,
//       //   );
//       // }
//     }

//     TextPainter painter;
//     painter = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );

//     var i = 0;
//     // Draw stations
//     for (final station in stations) {
//       paint.color = Colors.blue;
//       canvas.drawRect(
//         Rect.fromCenter(
//             center: Offset(station.x, station.y), width: 25, height: 25),
//         paint,
//       );
//       // for station number
//       i++;
//       painter.text = TextSpan(
//         text: '$i',
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 20.0,
//         ),
//       );
//       Offset position = Offset(
//         station.x - 4.0,
//         station.y - 12.0,
//       );
//       painter.layout();
//       painter.paint(canvas, position);
//     }

//     // Draw DTS
//     for (final dts in dtsList) {
//       paint.color = Colors.black;
//       canvas.drawCircle(Offset(dts.x, dts.y), 4, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
