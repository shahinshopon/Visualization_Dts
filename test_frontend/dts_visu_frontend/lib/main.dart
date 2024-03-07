import 'package:dts_visu_frontend/layer_screen.dart';
import 'package:flutter/material.dart';


void main() {
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
      home: LayerScreen(),
    );
  }
}






// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   var waypoint;
//   getWaypointData()async{
//     waypoint = TDSWaypointsHelper().getTDSWaypoints();
//   }

//   @override
//   void initState() {
//     getWaypointData();
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }