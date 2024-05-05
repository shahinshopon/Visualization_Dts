
class WayPointsModel {
  List<Waypoints>? waypoints;
  List<Layers>? layers;

  WayPointsModel({this.waypoints, this.layers});

  WayPointsModel.fromJson(Map<String, dynamic> json) {
    if (json['waypoints'] != null) {
      waypoints = <Waypoints>[];
      json['waypoints'].forEach((v) {
        waypoints!.add(new Waypoints.fromJson(v));
      });
    }
    if (json['layers'] != null) {
      layers = <Layers>[];
      json['layers'].forEach((v) {
        layers!.add(new Layers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.waypoints != null) {
      data['waypoints'] = this.waypoints!.map((v) => v.toJson()).toList();
    }
    if (this.layers != null) {
      data['layers'] = this.layers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Waypoints {
  int? x;
  int? y;
  bool? isStation;
  String? layer;
  String? stationName;

  Waypoints({required this.x,required this.y, this.isStation, this.layer, this.stationName});

  Waypoints.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    isStation = json['isStation'];
    layer = json['layer'];
    stationName = json['stationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['isStation'] = this.isStation;
    data['layer'] = this.layer;
    data['stationName'] = this.stationName;
    return data;
  }
}

class Layers {
  String? name;
  int? xMax;
  int? xMin;
  int? yMax;
  int? yMin;

  Layers({this.name, this.xMax, this.xMin, this.yMax, this.yMin});

  Layers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    xMax = json['xMax'];
    xMin = json['xMin'];
    yMax = json['yMax'];
    yMin = json['yMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['xMax'] = this.xMax;
    data['xMin'] = this.xMin;
    data['yMax'] = this.yMax;
    data['yMin'] = this.yMin;
    return data;
  }
}

