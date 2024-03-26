import dataclasses
import json
from typing import List
from datetime import datetime

@dataclasses.dataclass
class Location:
    id: int
    x: int
    y: int
    hasDrivingOrder: bool
    source: str = ''
    destination: str = ''
    time: datetime = datetime.now()

    def to_json(self) -> str:
        """Serialize the Location object to a JSON formatted str."""
        return json.dumps(dataclasses.asdict(self), indent=4)


    
@dataclasses.dataclass
class FtsData:
    locations: List[Location]

    def to_json(self) -> str:
        """Serialize the object to a JSON formatted str"""
        return json.dumps(dataclasses.asdict(self), indent=4)

    @staticmethod
    def from_json(data: str):
        """Deserialize a JSON formatted str to a LocationsArray object"""
        json_data = json.loads(data)
        locations = [Location(**item) for item in json_data]
        return FtsData(locations)
    

@dataclasses.dataclass
class Waypoint:
    x: int
    y: int
    isStation: bool
    stationName: str
    layer: str

@dataclasses.dataclass
class Layer:
    name: str
    xMax: int
    xMin: int
    yMax: int
    yMin: int

@dataclasses.dataclass
class WaypointData:
    waypoints: List[Waypoint]
    layers: List[Layer]

    def to_json(self) -> str:
        """Serialize the object to a JSON formatted str."""
        return json.dumps(dataclasses.asdict(self), indent=4)

    @staticmethod
    def from_json(data: str):
        """Deserialize a JSON formatted str to a MapData object."""
        json_data = json.loads(data)
        waypoints = [Waypoint(**wp) for wp in json_data['waypoints']]
        layers = [Layer(**layer) for layer in json_data['layers']]
        return WaypointData(waypoints=waypoints, layers=layers)
