class TdsWaypoints {
    String schema;
    String title;
    String type;
    TdsWaypointsProperties properties;
    List<String> required;

    TdsWaypoints({
        required this.schema,
        required this.title,
        required this.type,
        required this.properties,
        required this.required,
    });

}

class TdsWaypointsProperties {
    Waypoints waypoints;
    Layers layers;

    TdsWaypointsProperties({
        required this.waypoints,
        required this.layers,
    });

}

class Layers {
    String type;
    LayersProperties properties;
    List<String> required;

    Layers({
        required this.type,
        required this.properties,
        required this.required,
    });

}

class LayersProperties {
    Name name;
    XMax xMax;
    XMax xMin;
    XMax yMax;
    XMax yMin;

    LayersProperties({
        required this.name,
        required this.xMax,
        required this.xMin,
        required this.yMax,
        required this.yMin,
    });

}

class Name {
    String type;

    Name({
        required this.type,
    });

}

class XMax {
    int type;

    XMax({
        required this.type,
    });

}

class Waypoints {
    List<String> type;
    Items items;

    Waypoints({
        required this.type,
        required this.items,
    });

}

class Items {
    String type;
    ItemsProperties properties;
    List<String> required;
    bool additionalProperties;

    Items({
        required this.type,
        required this.properties,
        required this.required,
        required this.additionalProperties,
    });

}

class ItemsProperties {
    XMax x;
    XMax y;
    IsStation isStation;
    Name stationName;
    Name layer;

    ItemsProperties({
        required this.x,
        required this.y,
        required this.isStation,
        required this.stationName,
        required this.layer,
    });

}

class IsStation {
    bool type;

    IsStation({
        required this.type,
    });

}
