//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  final channel = WebSocketChannel.connect(
    //  Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade')
      Uri.parse('ws://0.0.0.0:5000/fts-data')
      );
  Box? socketBox;
  @override
  void initState() {
   
    socketBox = Hive.box('socketBox');
     strem();
    super.initState();
  }
var ftsFetchAllData = [];
  strem() async {
   try {
      await channel.ready;
    channel.stream.listen((message) {
      //  channel.sink.add(message);
      //  ftsFetchAllData.add(message);
      // var data = utf8.decode(message);
        setState(() {
         // ftsFetchAllData.add(message);
          socketBox!.add(message);
        });
    });
   } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
     print('Error fetching data: $e');
   }
   
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(socketBox?.keys.toList().length);
    return Scaffold(
      // body:  ListView.builder(
      //         itemCount: ftsFetchAllData.length,
      //         itemBuilder: (context,index){
      //        return ListTile(
      //         title: Text('${ftsFetchAllData[index]}'),
      //        );
      //         })
      body:  ValueListenableBuilder(
        valueListenable: Hive.box('socketBox').listenable(),
         builder: (context,box,widget){
          return ListView.builder(
              itemCount: socketBox?.keys.toList().length,
              itemBuilder: (context,index){
             return ListTile(
              title: Text('${socketBox?.getAt(index)}'),
             );
              });
         })
        
     
    );
  }
}

