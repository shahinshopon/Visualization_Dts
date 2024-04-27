// import 'package:dts_visu_frontend/test.dart';
// import 'package:flutter/material.dart';


// class LayerScreen extends StatelessWidget {

//   final List<Layer> layers = [
//     Layer([
//       Waypoint(300, 600, 1),
//       Waypoint(300, 620, 1),
//       Waypoint(300, 640, 1),
//     ], 300, 300, 600, 650),
//     Layer([
//       Waypoint(290, 600, 2),
//       Waypoint(280, 590, 2),
//       Waypoint(270, 580, 2),
//       Waypoint(260, 570, 2),
//       Waypoint(250, 560, 2),
//       Waypoint(240, 550, 2),
//     ], 200, 300, 600, 600),
//     Layer([
//       Waypoint(200, 600, 3),
//       Waypoint(200, 590, 3),
//       Waypoint(200, 580, 3),
//       Waypoint(200, 570, 3),
//       Waypoint(200, 560, 3),
//       Waypoint(200, 550, 3),
//     ], 200, 200, 600, 500),
//     Layer([
//       Waypoint(290, 500, 4),
//       Waypoint(280, 500, 4),
//       Waypoint(270, 500, 4),
//       Waypoint(260, 500, 4),
//       Waypoint(250, 500, 4),
//       Waypoint(240, 500, 4),
//     ], 200, 300, 500, 500),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//            height: 500,
//             width: 500,
//           child: Center(
//             child: GridView.builder(
//               shrinkWrap: true,
//               itemCount: layers.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 2,
//                 mainAxisSpacing: 20,
//                 crossAxisSpacing: 20), 
//               itemBuilder: (context,index){
//                 return InkWell(
//                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DTSVisualizationAppTwo() )),
//                   child: Container(
//                     // height: 200,
//                     // width: 300,
//                     color: Colors.amber,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text('Layer ${index+1}'),
//                         Text('MinX : ${layers[index].minX}'),
//                         Text('MinY : ${layers[index].minY}'),
//                         Text('MaxX : ${layers[index].maxX}'),
//                         Text('MaxY : ${layers[index].maxY}'),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DTSVisualizationAppTwo extends StatelessWidget {
//   final List<Layer> layers = [
//     Layer([
//       Waypoint(300, 600, 1),
//       Waypoint(300, 620, 1),
//       Waypoint(300, 640, 1),
//     ], 300, 300, 600, 650),
//     Layer([
//       Waypoint(290, 600, 2),
//       Waypoint(280, 600, 2),
//       Waypoint(270, 600, 2),
//       Waypoint(260, 600, 2),
//       Waypoint(250, 600, 2),
//       Waypoint(240, 600, 2),
//     ], 200, 300, 600, 600),
//     Layer([
//       Waypoint(200, 600, 3),
//       Waypoint(200, 590, 3),
//       Waypoint(200, 580, 3),
//       Waypoint(200, 570, 3),
//       Waypoint(200, 560, 3),
//       Waypoint(200, 550, 3),
//     ], 200, 200, 600, 500),
//     Layer([
//       Waypoint(290, 500, 4),
//       Waypoint(280, 500, 4),
//       Waypoint(270, 500, 4),
//       Waypoint(260, 500, 4),
//       Waypoint(250, 500, 4),
//       Waypoint(240, 500, 4),
//     ], 200, 300, 500, 500),
//     //////////////
//     Layer([
//       Waypoint(300, 450, 5),
//       Waypoint(300, 430, 5),
//       Waypoint(300, 410, 5),
//       Waypoint(300, 490, 5),
//       Waypoint(300, 470, 5),
//     ], 300, 300, 400, 500),
//     Layer([], 300, 250, 400, 400),
//     Layer([
//       Waypoint(300, 500, 4),
//       Waypoint(340, 470, 4),
//       Waypoint(420, 470, 4),

     
//     ], 300, 340, 490, 470),
//     Layer([], 340, 420, 470, 470),
//     Layer([], 420, 440, 470, 450),
//     Layer([
//       Waypoint(440, 450, 4),
//       Waypoint(500, 450, 4),
//       Waypoint(550, 450, 4),
//       Waypoint(560, 450, 4),
//       Waypoint(570, 450, 4),
//       Waypoint(580, 450, 4),
//       Waypoint(590, 450, 4),
//       Waypoint(600, 450, 4),
//       //Waypoint(610, 450, 4),
//     ], 440, 610, 450, 450),
//     Layer([], 500, 500, 450, 400),
//     Layer([
//       // Waypoint(630, 470, 4),
//     ], 610, 630, 450, 470),
//     Layer([
//      // Waypoint(80, 530, 2),
//      // Waypoint(80, 580, 2),
//      // Waypoint(100, 600, 2),
//      // Waypoint(200, 600, 2),
//     ], 100, 200, 600, 600),
//     Layer([

//     ], 80, 100, 580, 600),
//     Layer([], 80, 80, 530, 580),
//     Layer([
//      // Waypoint(150, 600, 3),
//      // Waypoint(150, 650, 3),
//     ], 150, 150, 600, 650),//dts
//     Layer([], 150, 170, 630, 630),//dts
//     Layer([], 230, 230, 600, 650),//dts
//     Layer([], 230, 250, 630, 630),//dts
//   ];

//   final List<Station> stations = [
//     Station(500, 400,'Station One'),
//     Station(250, 400,'Station Two'),
//   ];

//   final List<DTS> dtsList = [
//     DTS(300, 650,'Dts one'),
//     DTS(150, 650,'Dts two'),
//     DTS(170, 630,'Dts three'),
//     DTS(230, 650,'Dts four'),
//     DTS(250, 630,'Dts five'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Driverless Transport System'),
//       ),
//       body: Center(
//         child: Container(
//           width: double.maxFinite,
//           height: 700,
//           color: Colors.grey[300],
//           child: CustomPaint(
//             painter: DTSVisualizationPainter(layers, stations, dtsList),
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

//       paint.color = Colors.black;
//       paint.strokeWidth = 2.0;
//       canvas.drawLine(Offset(layer.minX, layer.minY),
//           Offset(layer.maxX, layer.maxY), paint);

//       // Draw waypoints
//       for (final waypoint in layer.waypoints) {
//         paint.color = Colors.black;
//         //canvas.drawCircle(Offset(waypoint.x, waypoint.y), 2, paint);
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
//    // for station number start
//     TextPainter painterOne;
//     painterOne = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//     // for station number end
//    // for station name start
//     TextPainter painterTwo;
//     painterTwo = TextPainter(
//       textAlign: TextAlign.left,
//       textDirection: TextDirection.ltr,
//     );
//    // for station name end
//     var i = 0;
//     // Draw stations
//     for (final station in stations) {
//       paint.color = Colors.blue;
//       canvas.drawRect(
//         Rect.fromCenter(
//             center: Offset(station.x, station.y), width: 25, height: 25),
//         paint,
//       );
//       // for station number start
//       i++;
//       painterOne.text = TextSpan(
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
//       painterOne.layout();
//       painterOne.paint(canvas, position);
//       // for station number end

//       // for station name start
//       painterTwo.text = TextSpan(
//         text: station.name,
//         style: const TextStyle(
//           color: Colors.blue,
//           fontSize: 13.0,
//         ),
//       );
//       Offset positionTwo = Offset(
//         station.x - 54.0,
//         station.y - 40.0,
//       );
//       painterTwo.layout();
//       painterTwo.paint(canvas, positionTwo);
//       // for station name end


//     }


//     // for dts name start
//     TextPainter painterThree;
//     painterThree = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//    // for dts name end
//     // Draw DTS
//     for (final dts in dtsList) {
//       paint.color = Colors.black;
//       canvas.drawCircle(Offset(dts.x, dts.y), 4, paint);
//      // for dts name start
//       painterThree.text = TextSpan(
//         text: dts.name,
//         style: const TextStyle(
//           color: Colors.blue,
//           fontSize: 10.0,
//         ),
//       );
//       Offset positionThree = Offset(
//         dts.x + 8.0,
//         dts.y ,
//       );
//       painterThree.layout();
//       painterThree.paint(canvas, positionThree);
//  // for dts name end
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
