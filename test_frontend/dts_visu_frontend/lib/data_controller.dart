// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class DataController extends GetxController {
//   final DataController dataController = Get.put(DataController());
//   final channel =
//       WebSocketChannel.connect(Uri.parse('ws://0.0.0.0:5000/fts-data'));
//   RxList<Map<String, dynamic>> sampleData = [
//     {
//       "id": 1,
//       "x": 131972,
//       "y": 190678,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.13"
//     },
//     {
//       "id": 4,
//       "x": 90115,
//       "y": 191712,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.133"
//     },
//     {
//       "id": 2,
//       "x": 75716,
//       "y": 159046,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.137"
//     },
//     {
//       "id": 3,
//       "x": 167156,
//       "y": 181539,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.14"
//     },
//   ].obs;

//   void updateData(newData) {
//     var existingIndex = newData['id'];
//     for (var i in sampleData) {
//       if (i['id'] == existingIndex) {
//         sampleData.remove(i);
//         sampleData.add(newData);
//       }
//     }
//     // data.removeWhere((i) => i['id'] == existingIndex);
//     // data.add(newData);
//   }
// }


//  import 'package:flutter/material.dart';

// class DataProvider extends ChangeNotifier {
//   List<dynamic> _data = [
//     {
//       "id": 1,
//       "x": 131972,
//       "y": 190678,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.13"
//     },
//     {
//       "id": 4,
//       "x": 90115,
//       "y": 191712,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.133"
//     },
//     {
//       "id": 2,
//       "x": 75716,
//       "y": 159046,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.137"
//     },
//     {
//       "id": 3,
//       "x": 167156,
//       "y": 181539,
//       "hasDrivingOrder": false,
//       "time": "2024-03-26T16:00:03.14"
//     },
//   ];


//   List<dynamic> get data => _data;

//   void updateData(Map<String, dynamic> newData) {
//        var existingIndex = newData['id'];
//     for (var i in data) {
//       if (i['id'] == existingIndex) {
//         data.remove(i);
//         data.add(newData);
//       }
//     }
//     notifyListeners();
//   }
// }
