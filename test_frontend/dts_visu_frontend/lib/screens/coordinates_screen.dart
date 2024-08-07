import 'package:dts_visu_frontend/const/app_colors.dart';
import 'package:dts_visu_frontend/model/waypoints_model.dart';
import 'package:flutter/material.dart';

class CoordinatePainter extends CustomPainter {
  final List<Waypoints> coordinates;
  var valueList;
  CoordinatePainter(
    this.coordinates,
    this.valueList,
  );

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

    final Map<String, Offset> coordinateMap = {};
    // Map each coordinate to the canvas size
    final List<Offset> mappedCoordinates = coordinates.map((coordinate) {
      final double x = (coordinate.x! - minX) / (maxX - minX) * canvasWidth;
      final double y = (-(coordinate.y! - maxY) / (maxY - minY) * canvasHeight);
      final offset = Offset(x, y);
      if (coordinate.isStation == true && coordinate.stationName != null) {
        coordinateMap[coordinate.stationName!] = offset;
      }
      return Offset(x, y);
    }).toList();

    // for station name
    TextPainter stationNamePainter;
    stationNamePainter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

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
      if (coordinates[i].isStation == true) {
        paint.color = darkColor;
        canvas.drawCircle(
            Offset(
              mappedCoordinates[i].dx,
              mappedCoordinates[i].dy + 12.0,
            ),
            2,
            paint);
        // station name style
        stationNamePainter.text = TextSpan(
          text: coordinates[i].stationName,
          style: const TextStyle(
            color: blueColor,
            fontSize: 8.0,
          ),
        );
        // station name position
        Offset positionTwo = Offset(
          mappedCoordinates[i].dx + 3.0,
          mappedCoordinates[i].dy + 8.0,
        );
        stationNamePainter.layout();
        stationNamePainter.paint(canvas, positionTwo);
      }
    }

    var mappedCoordinatesNew = valueList.map((coordinate) {
      final double x = (coordinate['x'] - minXForDts) /
          (maxXForDts - minXForDts) *
          canvasWidth;
      final double y = (-(coordinate['y'] - maxYForDts) /
          (maxYForDts - minYForDts) *
          canvasHeight);
      return Offset(x, y);
    }).toList();

    // for source circle text
    TextPainter sourceCircleNumberPainter;
    sourceCircleNumberPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (var i = 0; i < valueList.length; i++) {
      if (valueList[i]['source'] != null) {
        final stationOffset = coordinateMap[valueList[i]['destination']];
        if (stationOffset != null) {
          if (valueList[i]['id'] == 1) paint.color = Colors.black;
          if (valueList[i]['id'] == 2) paint.color = Colors.deepPurpleAccent;
          if (valueList[i]['id'] == 3) paint.color = Colors.green;
          if (valueList[i]['id'] == 4) paint.color = Colors.deepOrange;
          canvas.drawCircle(
              Offset(stationOffset.dx - 6, stationOffset.dy + 20), 10, paint);
          sourceCircleNumberPainter.text = TextSpan(
            text: '${valueList[i]['id']}',
            style: const TextStyle(
                color: lightColor, fontSize: 10.0, fontWeight: FontWeight.w600),
          );
          Offset position = Offset(
            stationOffset.dx - 10,
            stationOffset.dy + 12.0,
          );
          sourceCircleNumberPainter.layout();
          sourceCircleNumberPainter.paint(canvas, position);
        }
      }
    }

    // for station number
    TextPainter stationNumberPainter;
    stationNumberPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < mappedCoordinatesNew.length; i++) {
      // for (var i = 0; i < valueList.length - 1; i++) {
      if (valueList[i]['id'] == 1) paint.color = Colors.black;
      if (valueList[i]['id'] == 2) paint.color = Colors.deepPurpleAccent;
      if (valueList[i]['id'] == 3) paint.color = Colors.green;
      if (valueList[i]['id'] == 4) paint.color = Colors.deepOrange;

      canvas.drawRect(
        Rect.fromCenter(
            center: Offset(
                mappedCoordinatesNew[i].dx - 20, mappedCoordinatesNew[i].dy),
            // center: Offset(mappedCoordinates[i].dx, mappedCoordinates[i].dy),
            width: 25,
            height: 16),
        paint,
      );
      stationNumberPainter.text = TextSpan(
        text: '${valueList[i]['id']}',
        style: const TextStyle(
            color: lightColor, fontSize: 13.0, fontWeight: FontWeight.w600),
      );
      Offset position = Offset(
        mappedCoordinatesNew[i].dx - 22.0,
        mappedCoordinatesNew[i].dy - 8.0,
      );
      stationNumberPainter.layout();
      stationNumberPainter.paint(canvas, position);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
