from objects import FtsData, WaypointData


def load_fts_data_from_file(file_path: str) -> FtsData:
    with open(file_path, 'r') as file:
        json_data = file.read()
    return FtsData.from_json(json_data)


def load_mapdata_from_file(file_path: str) -> WaypointData:
    with open(file_path, 'r') as file:
        json_data = file.read()
    return WaypointData.from_json(json_data)

def load_mapdata_string_from_file(file_path: str) -> str:
    with open(file_path, 'r') as file:
        json_data = file.read()
    return json_data