import 'package:flutter/material.dart';
//import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  // var wsUrl = Uri.parse('ws://localhost:5004/fts-data');
  final channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade'));

  @override
  void initState() {
    // strem();
    super.initState();
  }

  strem() async {
    await channel.ready;
    channel.stream.listen((message) {
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
      print(message);
    });
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
          child: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          return Text(snapshot.hasData ? '${snapshot.data}' : '');
        },
      )),
    );
  }
}

