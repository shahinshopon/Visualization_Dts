import 'package:http/http.dart' as http;

class TDSWaypointsHelper{
  getTDSWaypoints()async{
    var response = await http.get(Uri.parse('https://json-schema.org/draft-07/schema'));
    if (response.statusCode==200) {
      var data = response.body;
      print(data);
    }
  }
}