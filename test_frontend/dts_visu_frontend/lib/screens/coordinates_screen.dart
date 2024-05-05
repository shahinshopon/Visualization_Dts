
import 'package:dts_visu_frontend/const/app_colors.dart';
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:flutter/material.dart';

class CoordinatePainter extends CustomPainter {
  final List<Waypoints> coordinates;
  List webSocketAllData;

  CoordinatePainter(this.coordinates, this.webSocketAllData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = blueColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // Define the range of your coordinates
    final double minX = 56343;
    final double maxX = 187040;
    final double minY = 142579;
    final double maxY = 199628;

    //Define the range of your dts value
    final double minXForDts = 56276;
    final double maxXForDts = 176074;
    final double minYForDts = 142570;
    final double maxYForDts = 198682;

    // Define the size of the canvas to map the coordinates to
    final double canvasWidth = size.width;
    final double canvasHeight = size.height;

    // Map each coordinate to the canvas size
    final List<Offset> mappedCoordinates = coordinates.map((coordinate) {
      final double x = (coordinate.x! - minX) / (maxX - minX) * canvasWidth;
      final double y = (-(coordinate.y! - maxY) / (maxY - minY) * canvasHeight);
      return Offset(x, y);
    }).toList();

    for (int i = 0; i < mappedCoordinates.length - 1; i++) {
     // Draw the 'x' mark
      canvas.drawLine(
        Offset(mappedCoordinates[i].dx - 3, mappedCoordinates[i].dy - 3),
        Offset(mappedCoordinates[i].dx + 3, mappedCoordinates[i].dy + 3),
        paint,
      );
      canvas.drawLine(
        Offset(mappedCoordinates[i].dx - 3, mappedCoordinates[i].dy + 3),
        Offset(mappedCoordinates[i].dx + 3, mappedCoordinates[i].dy - 3),
        paint,
      );
    }

    // for station number start
    TextPainter painterOne;
    painterOne = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    // for station number end
    // for station name start
    TextPainter painterTwo;
    painterTwo = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    // for station name end
    var stationNumber = 0;
    for (int i = 0; i < coordinates.length - 1; i++) {
      if (coordinates[i].isStation == true) {
        //start add for query If there is a driving order
        for (var j = 0; j < webSocketAllData.length; j++) {
          if (webSocketAllData[j]['hasDrivingOrder'] == true) {
            if (webSocketAllData[j]['destination'] ==
                    coordinates[i].stationName ||
                webSocketAllData[j]['source'] == coordinates[i].stationName) {
              paint.color = darkColor;
            }
          }
        }
        //end add for query If there is a driving order
        canvas.drawRect(
          Rect.fromCenter(
              center: Offset(mappedCoordinates[i].dx, mappedCoordinates[i].dy),
              width: 16,
              height: 16),
          paint,
        );
        // for station number start
        stationNumber++;
        painterOne.text = TextSpan(
          text: '$stationNumber',
          style: const TextStyle(
            color: lightColor,
            fontSize: 11.0,
          ),
        );

        Offset position = Offset(
          mappedCoordinates[i].dx - 6.0,
          mappedCoordinates[i].dy - 6.0,
        );
        painterOne.layout();
        painterOne.paint(canvas, position);
        // for station number end

        // for station name start
        painterTwo.text = TextSpan(
          text: coordinates[i].stationName,
          style: const TextStyle(
            color: blueColor,
            fontSize: 8.0,
          ),
        );
        Offset positionTwo = Offset(
          mappedCoordinates[i].dx + 12.0,
          mappedCoordinates[i].dy + 8.0,
        );
        painterTwo.layout();
        painterTwo.paint(canvas, positionTwo);
        // for station name end
      }
    }

    // Draw DTS
    List mappedCoordinatesNew = webSocketAllData.map((coordinate) {
      final double x = (coordinate['x'] - minXForDts) /
          (maxXForDts - minXForDts) *
          canvasWidth;
      final double y = (-(coordinate['y'] - maxYForDts) /
          (maxYForDts - minYForDts) *
          canvasHeight);
      return Offset(x, y);
    }).toList();

    for (int i = 0; i < mappedCoordinatesNew.length - 1; i++) {
      paint.color = darkColor;
      canvas.drawCircle(
          Offset(mappedCoordinatesNew[i].dx, mappedCoordinatesNew[i].dy),
          2,
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}