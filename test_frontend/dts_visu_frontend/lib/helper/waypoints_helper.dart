import 'dart:convert';
import 'package:dts_visu_frontend/const/app_styles.dart';
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:http/http.dart' as http;

class TDSWaypointsHelper {
  getTDSWaypoints() async {
    var response = await http.get(
        Uri.parse(
          'http://0.0.0.0:5000/waypoints',
        ),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        });

    if (response.statusCode == 200) {
      var data = response.body;

      WayPointsModel newModelTwoModel =
          WayPointsModel.fromJson(jsonDecode(response.body));

      return newModelTwoModel;
    } else {
      failedSnackBar(message: 'Something is wrong, status code${response.statusCode} error');
    }
  }
}
