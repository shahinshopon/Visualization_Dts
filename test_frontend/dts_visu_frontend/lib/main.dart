import 'package:dts_visu_frontend/const/app_strings.dart';
import 'package:dts_visu_frontend/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('socketBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final channel =
      WebSocketChannel.connect(Uri.parse('ws://0.0.0.0:5000/fts-data'));

  Box? socketBox;

  @override
  void initState() {
    //Hive.box('socketBox').clear();
    socketBox = Hive.box('socketBox');
    strem();
    super.initState();
  }

  var ftsFetchAllData = [];

  strem() async {
    try {
      await channel.ready;
      channel.stream.listen((message) {
        setState(() {
          socketBox!.add(message);
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      // print('Error fetching data: $e');
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
