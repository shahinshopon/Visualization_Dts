from data_provider import *
from objects import *
from quart import Quart, websocket, render_template, jsonify
from pathlib import Path
import asyncio

app = Quart(__name__)

script_directory = Path(__file__).parent

waypoint_data_file = (script_directory / 'data' / 'waypointData.json').resolve()
fts_data_file = (script_directory / 'data' / 'ftsData.json').resolve()

waypoint_data = load_mapdata_string_from_file(waypoint_data_file)
fts_data = load_fts_data_from_file(fts_data_file)

async def send_periodic_messages(ws):
    for data in fts_data.locations:
        try:
            await ws.send(data.to_json())
        except asyncio.CancelledError:
            # The connection was closed, so cancel this task
            break
        await asyncio.sleep(1)  # Wait for 1 seconds before sending the next message


# RESTful API endpoint
@app.route('/waypoints')
async def get_data():
    return waypoint_data

# WebSocket route for API 1
@app.websocket('/fts-data')
async def ws_api1():
    await send_periodic_messages(websocket)

if __name__ == '__main__':
    app.run()
