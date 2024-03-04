from quart import Quart, websocket, render_template, jsonify
import asyncio

app = Quart(__name__)


sample_data_api1 = ["Data1 API1", "Data2 API1", "Data3 API1"]
sample_data_api2 = ["Data1 API2", "Data2 API2", "Data3 API2"]

async def send_periodic_messages(ws, data_list):
    for data in data_list:
        try:
            await ws.send(data)
        except asyncio.CancelledError:
            # The connection was closed, so cancel this task
            break
        await asyncio.sleep(15)  # Wait for 15 seconds before sending the next message


# RESTful API endpoint
@app.route('/api/data')
async def get_data():
    return jsonify({'message': 'Hello from REST API'})

# WebSocket route for API 1
@app.websocket('/ws/api1')
async def ws_api1():
    while True:
        data = await websocket.receive()
        print(f"WS API 1 received: {data}")
        await websocket.send(f"Echo from WS API 1: {data}")

# WebSocket route for API 2
@app.websocket('/ws/api2')
async def ws_api2():
    await send_periodic_messages(websocket, sample_data_api2)

if __name__ == '__main__':
    app.run()
