import 'dart:convert';

import 'package:dts_visu_frontend/model/new_model.dart';
import 'package:http/http.dart' as http;

class TDSWaypointsHelper {
  getTDSWaypoints() async {
    var response = await http.get(
        Uri.parse(
          'http://127.0.0.1:5000/waypoints',
        ),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        });

    if (response.statusCode == 200) {
      var data = response.body;

      NewModelTwo newModelTwoModel =
          NewModelTwo.fromJson(jsonDecode(response.body));

      return newModelTwoModel;
    } else {
      print(response.statusCode);
    }
  }
}
